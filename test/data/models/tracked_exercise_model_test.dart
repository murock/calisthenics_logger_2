import 'package:calisthenics_logger_2/data/datasources/models/tracked_exercise_model.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTrackedExerciseModel = TrackedExerciseModel(trackedExercises: []);

  test(
    'should be a subclass of GroupedTrackedExercises',
    () async {
      // assert
      expect(tTrackedExerciseModel, isA<GroupedTrackedExercises>());
    },
  );
}
