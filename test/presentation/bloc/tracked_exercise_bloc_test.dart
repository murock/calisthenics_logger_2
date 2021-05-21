import 'package:calisthenics_logger_2/core/util/params.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/usecases/get_specific_tracked_exercise_on_date.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/trackedExerciseDbData.dart';

class MockGetSpecificTrackedExerciseOnDate extends Mock
    implements GetSpecificTrackedExerciseOnDate {}

void main() {
  late TrackedExerciseBloc bloc;
  late MockGetSpecificTrackedExerciseOnDate
      mockGetSpecificTrackedExerciseOnDate;

  setUp(() {
    mockGetSpecificTrackedExerciseOnDate =
        MockGetSpecificTrackedExerciseOnDate();

    bloc = TrackedExerciseBloc(
        getSpecificTrackedExerciseOnDate: mockGetSpecificTrackedExerciseOnDate);
  });

  test(
    'initialState should be ',
    () async {
      //assert
      expect(bloc.state, equals(TrackedExerciseEmpty()));
    },
  );

  group('GetSpecificTrackedExerciseOnDate', () {
    final tTrackedExercises = regularDataGroupTrackEx;

    test(
      'should get data from use case',
      () async {
        //arrange
        when(mockGetSpecificTrackedExerciseOnDate(
                Params(exerciseName: 'Pull Up', date: new DateTime(2021))))
            .thenAnswer((_) async => Right(tTrackedExercises));
        //act

        //assert
      },
    );
  });
}
