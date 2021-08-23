import 'package:calisthenics_logger_2/data/datasources/database/firestore/tracked_exercise_db.dart';
import 'package:calisthenics_logger_2/data/datasources/database/tracked_exercise_db_helper.dart';
import 'package:calisthenics_logger_2/data/datasources/implementations/tracked_exercises_data_source_impl.dart';
import 'package:calisthenics_logger_2/data/models/tracked_exercise_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/trackedExerciseDbData.dart';
import 'tracked_exercise_data_source_impl_test.mocks.dart';

@GenerateMocks([TrackedExerciseDb])
void main() {
  late TrackedExerciseDataSourceImpl dataSource;
  late TrackedExerciseDb mockTrackedExerciseDb;

  setUp(() {
    mockTrackedExerciseDb = MockTrackedExerciseDb();
     dataSource =
         TrackedExerciseDataSourceImpl(trackedExerciseDb: mockTrackedExerciseDb);
  });

  group('getSpecificTrackedExerciseOnDate', () {
    rawDbData
    final tTrackedExerciseModel = TrackedExerciseModel.fromQueryDocumentSnapshot(snapshots);

    test(
      'should return a list of TrackedExercises when getSpecificTrackedExerciseOnDate is called',
      () async {
        // Arrange
        when(mockTrackedExerciseDbHelper.queryAllGivenNameAndDate(any, any))
            .thenAnswer((_) async => rawDbData);
        // Act
        final result = await dataSource.getSpecificTrackedExerciseOnDate(
            'Pull Up', new DateTime(2021));
        //assert
        verify(mockTrackedExerciseDbHelper.queryAllGivenNameAndDate(
            'Pull Up', 1609459200));
        expect(result, equals(tTrackedExerciseModel));
      },
    );
  });
}
