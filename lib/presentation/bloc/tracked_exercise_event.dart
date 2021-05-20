part of 'tracked_exercise_bloc.dart';

abstract class TrackedExerciseEvent extends Equatable {
  const TrackedExerciseEvent();
}

class GetTrackedExerciseForDateAndName extends TrackedExerciseEvent {
  final String exerciseName;
  final DateTime date;

  GetTrackedExerciseForDateAndName(this.exerciseName, this.date);

  @override
  List<Object?> get props => [this.exerciseName, this.date];
}

class AddTrackedExercise extends TrackedExerciseEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
