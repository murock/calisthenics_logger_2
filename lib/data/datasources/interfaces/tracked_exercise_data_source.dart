import 'package:calisthenics_logger_2/data/models/tracked_exercise_model.dart';

abstract class TrackedExerciseDataSource {
  Future<TrackedExerciseModel> getSpecificTrackedExerciseOnDate(
      String exerciseName, DateTime date);

  Stream<TrackedExerciseModel> getSpecificTrackedExerciseOnDateStream(
      String exerciseName, DateTime date);

  Future<bool> addTrackedExercise(
      String name,
      DateTime timestamp,
      int setNum,
      int? reps,
      double? weight,
      int? holdTime,
      String? band,
      String? tempo,
      String? tool,
      int? rest,
      String? cluster);
}
