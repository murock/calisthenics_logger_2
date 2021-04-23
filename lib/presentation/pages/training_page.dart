import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/training_display.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TrainingDisplay(
      trackedExercise: new TrackedExercise(
          numPopulatedFields: 1,
          exerciseName: 'test',
          date: new DateTime(1993),
          rows: []),
    );
  }
}
