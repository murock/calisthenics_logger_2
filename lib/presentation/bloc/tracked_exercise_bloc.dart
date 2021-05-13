import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'tracked_exercise_event.dart';
part 'tracked_exercise_state.dart';

@injectable
class TrackedExerciseBloc
    extends Bloc<TrackedExerciseEvent, TrackedExerciseState> {
  //final GetSpecificTrackedExerciseOnDate getSpecificTrackedExerciseOnDate;

  TrackedExerciseBloc() : super(TrackedExerciseEmpty());

  //TrackedExerciseBloc({required this.getSpecificTrackedExerciseOnDate})
  //  : super(TrackedExerciseEmpty());

  @override
  Stream<TrackedExerciseState> mapEventToState(
    TrackedExerciseEvent event,
  ) async* {
    if (event is GetTrackedExerciseForDateAndName) {
      yield TrackedExerciseLoading();
      // final failureOrTrackedExercises = await getSpecificTrackedExerciseOnDate(
      //   Params(exerciseName: event.exerciseName, date: event.date),
      // );
      // yield* _eitherLoadedOrErrorState(failureOrTrackedExercises);
    }
  }

  Stream<TrackedExerciseState> _eitherLoadedOrErrorState(
      Either<Failure, GroupedTrackedExercises>
          failureOrTrackedExercises) async* {
    yield failureOrTrackedExercises.fold(
      (failure) =>
          TrackedExerciseError(message: 'Error getting tracked exercises'),
      (trackedExercises) =>
          TrackedExerciseLoaded(trackedExercises: trackedExercises),
    );
  }
}
