import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/core/util/params.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/usecases/get_specific_tracked_exercise_on_date.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/trackedExerciseDbData.dart';
import 'tracked_exercise_bloc_test.mocks.dart';

@GenerateMocks([GetSpecificTrackedExerciseOnDate])
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
    final GroupedTrackedExercises tTrackedExercises = regularDataGroupTrackEx;

    test(
      'should emit [Error] when either exerciseName or date are null',
      () async {
        //arrange
        when(mockGetSpecificTrackedExerciseOnDate(any)).thenAnswer((_) async =>
            Left(DatabaseFailure(
                'Attempted to get all tracked exercises with null exercise name or null date')));
        //assert later
        final expected = [
          TrackedExerciseLoading(),
          TrackedExerciseError(message: 'Error getting tracked exercises')
        ];
        expectLater(bloc.stream, emitsInOrder(expected));
        //act
        bloc.add(
            GetTrackedExerciseForDateAndName('Pull Up', new DateTime(2021)));
      },
    );

    test(
      'should get data from GetSpecificTrackedExerciseOnDate use case',
      () async {
        //arrange
        Params params =
            Params(exerciseName: 'Pull Up', date: new DateTime(2021));
        when(mockGetSpecificTrackedExerciseOnDate(any))
            .thenAnswer((_) async => Right(tTrackedExercises));
        //act
        bloc.add(
            GetTrackedExerciseForDateAndName('Pull Up', new DateTime(2021)));
        await untilCalled(mockGetSpecificTrackedExerciseOnDate(params));
        //assert
      },
    );
  });
}
