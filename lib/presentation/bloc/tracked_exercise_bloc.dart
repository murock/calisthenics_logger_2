import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/core/util/params.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/usecases/add_tracked_exercise_to_storage.dart';
import 'package:calisthenics_logger_2/domain/usecases/get_specific_tracked_exercise_on_date.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'tracked_exercise_event.dart';
part 'tracked_exercise_state.dart';

@injectable
class TrackedExerciseBloc
    extends Bloc<TrackedExerciseEvent, TrackedExerciseState> {
  final GetSpecificTrackedExerciseOnDate getSpecificTrackedExerciseOnDate;
  final AddTrackedExerciseToStorage addTrackedExercise;

  final _streamController = StreamController<TrackedExerciseState>()

  TrackedExerciseBloc(
      {required this.getSpecificTrackedExerciseOnDate,
      required this.addTrackedExercise})
      : super(TrackedExerciseEmpty());

  @override
  Stream<TrackedExerciseState> mapEventToState(
    TrackedExerciseEvent event,
  ) async* {
    if (event is GetTrackedExerciseForDateAndName) {
      yield TrackedExerciseLoading();
      yield* _getTrackedExerciseStream(event);
    } else if (event is AddTrackedExercise) {
      yield TrackedExerciseLoading();
      final failureOrAddedSuccess = await addTrackedExercise(Params(
        exerciseName: event.exerciseName,
        timestamp: event.date,
        setNum: event.setNum,
        reps: event.reps,
        weight: event.weight,
        holdTime: event.holdTime,
        band: event.band,
        tempo: event.tempo,
        tool: event.tool,
        rest: event.rest,
        cluster: event.cluster,
      ));
      var addStream = _eitherAddedSuccessOrError(failureOrAddedSuccess);
      await for (var AddedOrError in addStream) {
        if (AddedOrError) {
          GetTrackedExerciseForDateAndName getEvent =
              GetTrackedExerciseForDateAndName(event.exerciseName, event.date);
          yield* _getTrackedExerciseStream(getEvent);
        } else {
          TrackedExerciseError(message: 'Error adding tracked exercises');
        }
      }
    }
  }

  Stream<TrackedExerciseState> _getTrackedExerciseStream(
      GetTrackedExerciseForDateAndName event) async* {
    final failureOrTrackedExercises = await getSpecificTrackedExerciseOnDate(
      Params(exerciseName: event.exerciseName, timestamp: event.date),
    );
    yield* _eitherLoadedOrErrorState(failureOrTrackedExercises);
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

  Stream<bool> _eitherAddedSuccessOrError(
      Either<Failure, bool> failureOrAddedSuccess) async* {
    yield failureOrAddedSuccess.fold(
      (failure) => false,
      (addedSuccess) => true,
    );
  }
}
