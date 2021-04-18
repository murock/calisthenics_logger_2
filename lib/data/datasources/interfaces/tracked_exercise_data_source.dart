import 'package:calisthenics_logger_2/data/models/tracked_exercise_model.dart';

abstract class TrackedExerciseDataSource {
  Future<TrackedExerciseModel> getSpecificTrackedExerciseOnDate(
      String exerciseName, DateTime date);
}
