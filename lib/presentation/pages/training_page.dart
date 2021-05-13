import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/injection.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/training_display.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
        title: 'Training',
        body: StyledContainer(
          child: buildBody(context),
        ));
  }

  BlocProvider<TrackedExerciseBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<TrackedExerciseBloc>(),
        child: TrainingDisplay(
          trackedExercise: new TrackedExercise(
              numPopulatedFields: 1,
              exerciseName: 'test',
              date: new DateTime(1993),
              rows: []),
        ));
  }
}
