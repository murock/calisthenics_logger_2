import 'package:calisthenics_logger_2/data/datasources/models/tracked_exercise_model.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/trackedExerciseDbData.dart';

void main() {
  final tTrackedExerciseModel =
      TrackedExerciseModel(trackedExercises: regularDataTrackExs);

  test(
    'should be a subclass of GroupedTrackedExercises',
    () async {
      // assert
      expect(tTrackedExerciseModel, isA<GroupedTrackedExercises>());
    },
  );

  group('fromRows', () {
    test(
      'should return a GroupedTrackedExercises with proper data',
      () async {
        //arrange
        final List<Map<String, dynamic>> queryRows = regularData;
        //act
        final result = TrackedExerciseModel.fromRows(queryRows);
        //assert
        expect(1, 1);
        expect(result, tTrackedExerciseModel);
      },
    );
  });
}
