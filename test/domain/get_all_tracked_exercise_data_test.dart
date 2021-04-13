import 'package:calisthenics_logger_2/core/util/no_params.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/repos/tracked_exercise_repo.dart';
import 'package:calisthenics_logger_2/domain/usecases/get_all_tracked_exercise_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTrackedExerciseRepo extends Mock implements TrackedExerciseRepo {}

void main() {
  MockTrackedExerciseRepo mockExerciseRepo = MockTrackedExerciseRepo();
  GetAllTrackedExerciseData usecase =
      GetAllTrackedExerciseData(mockExerciseRepo);

  setUp(() {
    mockExerciseRepo = MockTrackedExerciseRepo();
    usecase = GetAllTrackedExerciseData(mockExerciseRepo);
  });

  final tExerciseRowDatas = [
    TrackedExerciseRow(setNum: '1', reps: '4', weight: '5', tool: 'wide'),
    TrackedExerciseRow(setNum: '2', reps: '5', weight: '5', tool: 'wide'),
    TrackedExerciseRow(setNum: '3', reps: '4', weight: '10', tool: 'wide'),
  ];

  final tExerciseData = new TrackedExercise(
      exerciseName: 'Pull Ups',
      numPopulatedFields: 3,
      date: DateTime(2021, 1, 1),
      rows: tExerciseRowDatas);

  test(
    'should get all tracked exercises from the repo',
    () async {
      // arrange
      when(mockExerciseRepo.getAllExerciseData())
          .thenAnswer((_) async => Right(tExerciseData));
      // act
      final result = await usecase(NoParams());
      //assert
      expect(result, Right(tExerciseData));
      verify(mockExerciseRepo.getAllExerciseData());
      verifyNoMoreInteractions(mockExerciseRepo);
    },
  );
}