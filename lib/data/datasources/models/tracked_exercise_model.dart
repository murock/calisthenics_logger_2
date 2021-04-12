import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';

class TrackedExerciseModel extends TrackedExercise {
  TrackedExerciseModel({
    required int numPopulatedFields,
    required String exerciseName,
    required DateTime date,
    required List<TrackedExerciseRow> rows,
  }) : super(
          numPopulatedFields: numPopulatedFields,
          exerciseName: exerciseName,
          date: date,
          rows: rows,
        );
}
