import 'package:calisthenics_logger_2/core/util/params.dart';
import 'package:calisthenics_logger_2/domain/entities/exercise.dart';
import 'package:calisthenics_logger_2/domain/repos/exercise_repo.dart';
import 'package:calisthenics_logger_2/domain/usecases/get_exercise.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_exercise_test.mocks.dart';

@GenerateMocks([ExerciseRepo])
void main() {
  MockExerciseRepo mockExerciseRepo = MockExerciseRepo();
  GetExercise usecase = GetExercise(mockExerciseRepo);

  final tExercise = Exercise(
      name: 'Pull Up',
      progressions: ['Muscle Up'],
      muscleGroups: ['Back, Bicep']);

  test(
    'should get exercise from the repo ',
    () async {
      // Arrange
      when(mockExerciseRepo.getExercise(any))
          .thenAnswer((_) async => Right(tExercise));
      // Act
      final result = await usecase(Params());
      // Assert
      expect(result, Right(tExercise));
      verify(mockExerciseRepo.getExercise(any));
      verifyNoMoreInteractions(mockExerciseRepo);
    },
  );
}
