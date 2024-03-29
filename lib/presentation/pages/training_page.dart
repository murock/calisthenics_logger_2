import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/injection.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/training_display.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/training_menu.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledScaffold(
      title: 'Training',
      body: StyledContainer(
        child: buildBody(context),
      ),
      completedSetDrawerItems: StyledScaffold.createSampleDrawerItems(),
      appBarActions: [
        TrainingMenu(
          includeWeight: true,
          includeBand: true,
        ),
      ],
    );
  }

  BlocProvider<TrackedExerciseBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<TrackedExerciseBloc>(),
        child: TrainingDisplay(
          trackedExercise: new TrackedExercise(
              numPopulatedFields: 1,
              exerciseName: 'Pull Up',
              date: DateTime.now(),
              rows: []),
        ));
  }
}
