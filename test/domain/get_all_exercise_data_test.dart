import 'package:calisthenics_logger_2/core/util/no_params.dart';
import 'package:calisthenics_logger_2/domain/entities/exercise_data.dart';
import 'package:calisthenics_logger_2/domain/repos/exercise_repo.dart';
import 'package:calisthenics_logger_2/domain/usecases/get_all_exercise_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockExerciseRepo extends Mock implements ExerciseRepo {}

void main() {
  MockExerciseRepo mockExerciseRepo = MockExerciseRepo();
  GetAllExerciseData usecase = GetAllExerciseData(mockExerciseRepo);

  setUp(() {
    mockExerciseRepo = MockExerciseRepo();
    usecase = GetAllExerciseData(mockExerciseRepo);
  });

  final tExerciseRowDatas = [
    ExerciseRowData(
        setNum: '1', reps: '4', weight: '5', band: '', tool: 'wide'),
    ExerciseRowData(
        setNum: '2', reps: '5', weight: '5', band: '', tool: 'wide'),
    ExerciseRowData(
        setNum: '3', reps: '4', weight: '10', band: '', tool: 'wide'),
  ];

  final tExerciseData = new ExerciseData(
      exerciseName: 'Pull Ups',
      numPopulatedFields: 3,
      date: DateTime(2021, 1, 1),
      rowData: tExerciseRowDatas);

  test(
    'should get all exercises from the repo',
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
