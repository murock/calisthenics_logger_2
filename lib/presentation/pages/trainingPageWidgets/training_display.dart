import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/data/datasources/database/firestore/tracked_exercise_db.dart';
import 'package:calisthenics_logger_2/data/datasources/database/tracked_exercise_db_helper.dart';
import 'package:calisthenics_logger_2/data/models/tracked_exercise_model.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/add_remove_row.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/band_dropdown.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/exercise_input.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/recorded_exercise_item.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/user_entered_data.dart';
import 'package:calisthenics_logger_2/presentation/widgets/loading_widget.dart';
import 'package:calisthenics_logger_2/presentation/widgets/message_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'exercise_list_view.dart';

class TrainingDisplay extends StatefulWidget {
  final TrackedExercise trackedExercise;

  const TrainingDisplay({Key? key, required this.trackedExercise})
      : super(key: key);

  @override
  _TrainingDisplayState createState() => _TrainingDisplayState();
}

class _TrainingDisplayState extends State<TrainingDisplay> {
  UserEnteredData userEnteredData = UserEnteredData();
  int nextSetNumber = 1;

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Text(
            _getTitle(widget.trackedExercise),
            style: Theme.of(context).textTheme.headline1,
            //  style: TextStyle(color: Colors.red),
          ),
        ),
        ExerciseInput(
          value: 9,
          subText: 'Reps',
          valueCallback: userEnteredData.setReps,
        ),
        ExerciseInput(
          value: 10,
          subText: 'kgs',
          valueCallback: userEnteredData.setWeight,
        ),
        BandDropdown(),
        AddRemoveRow(
          onAddClick: () {
            _addTrackedExercise(userEnteredData, nextSetNumber);
          },
          onRemoveClick: () => print('remove clicked'),
        ),
        BlocBuilder<TrackedExerciseBloc, TrackedExerciseState>(
          builder: (context, state) {
            if (state is TrackedExerciseEmpty) {
              // Kick off request to get the TrackedExercises for selected day and exercise
              BlocProvider.of<TrackedExerciseBloc>(context).add(
                  GetTrackedExerciseForDateAndName('Pull Up', DateTime.now()));
              return MessageDisplay(message: 'Connecting to workouts Database');
            } else if (state is TrackedExerciseLoading) {
              return LoadingWidget();
            } else if (state is TrackedExerciseLoaded) {
              if (state.trackedExercises.trackedExercises.length > 0) {
                nextSetNumber =
                    state.trackedExercises.trackedExercises[0].rows.length + 1;
              }
              return ExerciseListView(trackedExercises: state.trackedExercises);
            } else if (state is TrackedExerciseError) {
              return MessageDisplay(message: state.message);
            }
            return Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Placeholder(),
            );
          },
        ),
      ],
    );
  }

  void _addTrackedExercise(UserEnteredData userEnteredData, int setCount) {
    BlocProvider.of<TrackedExerciseBloc>(context).addTrackedExerciseToDb(
        AddTrackedExercise(
            'Pull Up',
            DateTime.now(),
            setCount,
            userEnteredData.reps,
            userEnteredData.weight,
            userEnteredData.holdTime,
            userEnteredData.band,
            userEnteredData.tempo,
            userEnteredData.tool,
            userEnteredData.rest,
            userEnteredData.cluster));
  }
}

String _getTitle(TrackedExercise trackedExercise) {
  String result = '';
  if (_isDateTimeToday(trackedExercise.date)) {
    result = trackedExercise.exerciseName + ' - Today';
  } else {
    result = trackedExercise.exerciseName +
        ' - ' +
        _formatDateTimeToString(trackedExercise.date);
  }
  return result;
}

bool _isDateTimeToday(DateTime dateTime) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final dateToCheck = DateTime(dateTime.year, dateTime.month, dateTime.day);
  if (dateToCheck == today) {
    return true;
  } else {
    return false;
  }
}

String _formatDateTimeToString(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(dateTime);
}
