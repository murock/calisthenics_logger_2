import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/data/datasources/database/tracked_exercise_db_helper.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/add_remove_row.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/band_dropdown.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/exercise_input.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/recorded_exercise_item.dart';
import 'package:calisthenics_logger_2/presentation/widgets/loading_widget.dart';
import 'package:calisthenics_logger_2/presentation/widgets/message_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingDisplay extends StatelessWidget {
  final TrackedExercise trackedExercise;

  const TrainingDisplay({Key? key, required this.trackedExercise})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Text(
            'Pull Up - Today',
            style: Theme.of(context).textTheme.headline1,
            //  style: TextStyle(color: Colors.red),
          ),
        ),
        ExerciseInput(
          mainText: '10',
          subText: 'Reps',
        ),
        ExerciseInput(
          mainText: '20',
          subText: 'kgs',
        ),
        BandDropdown(),
        AddRemoveRow(
          onAddClick: () => AddExerciseToDbTEMPMETHODTOREMOVE(context),
          onRemoveClick: () =>
              RemoveTodaysExerciseFromDbTEMPMETHODTOREMOVE(context),
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
}

Future<void> AddExerciseToDbTEMPMETHODTOREMOVE(BuildContext context) async {
  int i = await TrackedExerciseDbHelper.insert({
    TrackedExerciseDbHelper.name: 'Pull up',
    TrackedExerciseDbHelper.timestamp: getUnixTimeFromDateTime(DateTime.now()),
    TrackedExerciseDbHelper.setNum: 1,
    TrackedExerciseDbHelper.reps: 10,
    TrackedExerciseDbHelper.rest: 30,
    TrackedExerciseDbHelper.weight: 20,
  });

  BlocProvider.of<TrackedExerciseBloc>(context).add(AddTrackedExercise());
  print('the inserted id is $i');
}

Future<void> RemoveTodaysExerciseFromDbTEMPMETHODTOREMOVE(
    BuildContext context) async {
  await TrackedExerciseDbHelper.DELETEtODAYSeXERCISEStodoDELETETHISMETHOD(
      getUnixTimeFromDateTime(DateTime.now()));

  // Temp use of Add event just to refresh the list with everything deleted
  BlocProvider.of<TrackedExerciseBloc>(context).add(AddTrackedExercise());
}

class ExerciseListView extends StatelessWidget {
  final GroupedTrackedExercises trackedExercises;

  const ExerciseListView({
    Key? key,
    required this.trackedExercises,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPopulated = trackedExercises.trackedExercises.length > 0;
    return Flexible(
      child: Container(
        height: 200,
        child: !isPopulated
            ? Container()
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.white,
                ),
                // TODO: DO NOT ASSUME THERE IS ONE TRACKEDEXERCISE #ASKINGFORTROUBLE
                itemCount: trackedExercises.trackedExercises[0].rows.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(1),
                  child: RecordedExerciseItem(
                    setNum:
                        trackedExercises.trackedExercises[0].rows[index].setNum,
                    reps: trackedExercises.trackedExercises[0].rows[index].reps,
                  ),
                ),
              ),
      ),
    );
  }
}
