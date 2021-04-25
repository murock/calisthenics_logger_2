import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/injection_container.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/training_display.dart';
import 'package:calisthenics_logger_2/presentation/widgets/loading_widget.dart';
import 'package:calisthenics_logger_2/presentation/widgets/message_display.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
        title: 'Training',
        body: SingleChildScrollView(
          child: buildBody(context),
        ));
  }

  BlocProvider<TrackedExerciseBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (context) => TrackedExerciseBloc(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                // TODO: move the bloc building to just above the list widget
                BlocBuilder<TrackedExerciseBloc, TrackedExerciseState>(
                  builder: (context, state) {
                    if (state is TrackedExerciseEmpty) {
                      return MessageDisplay(
                          message: 'Empty tracked exercise state');
                    } else if (state is TrackedExerciseLoading) {
                      return LoadingWidget();
                    } else if (state is TrackedExerciseLoaded) {
                      return TrainingDisplay(
                        trackedExercise: new TrackedExercise(
                            numPopulatedFields: 1,
                            exerciseName: 'test',
                            date: new DateTime(1993),
                            rows: []),
                      );
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
            ),
          ),
        ));
  }
}
