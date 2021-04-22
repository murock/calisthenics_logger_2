part of 'tracked_exercise_bloc.dart';

abstract class TrackedExerciseState extends Equatable {
  const TrackedExerciseState();
}

class TrackedExerciseEmpty extends TrackedExerciseState {
  @override
  List<Object> get props => [];
}

class TrackedExerciseLoading extends TrackedExerciseState {
  @override
  List<Object> get props => [];
}

class TrackedExerciseLoaded extends TrackedExerciseState {
  final GroupedTrackedExercises trackedExercises;

  TrackedExerciseLoaded({required this.trackedExercises});

  @override
  List<Object> get props => [trackedExercises];
}

class TrackedExerciseError extends TrackedExerciseState {
  final String message;

  TrackedExerciseError({required this.message});

  @override
  List<Object> get props => [message];
}
