import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/usecases/get_specific_tracked_exercise_on_date.dart';
import 'package:equatable/equatable.dart';

part 'tracked_exercise_event.dart';
part 'tracked_exercise_state.dart';

// TODO: look to see where timestamp converter is used and use it here instead?
class TrackedExerciseBloc
    extends Bloc<TrackedExerciseEvent, TrackedExerciseState> {
  final GetSpecificTrackedExerciseOnDate getSpecificTrackedExerciseOnDate;

  TrackedExerciseBloc({required this.getSpecificTrackedExerciseOnDate})
      : super(TrackedExerciseEmpty());

  @override
  Stream<TrackedExerciseState> mapEventToState(
    TrackedExerciseEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is GetTrackedExerciseForDateAndName){
      // TODO: Here is where to do input conversion
      yield TrackedExerciseLoading();
      final failureOrTrackedExercises
    }
  }
}
