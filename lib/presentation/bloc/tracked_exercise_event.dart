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
  final String exerciseName;
  final DateTime date;
  final int setNum;
  final int reps;
  final double weight;
  final int holdTime;
  final String band;
  final String tempo;
  final String tool;
  final int rest;
  final String cluster;

  AddTrackedExercise(
      this.exerciseName,
      this.date,
      this.setNum,
      this.reps,
      this.weight,
      this.holdTime,
      this.band,
      this.tempo,
      this.tool,
      this.rest,
      this.cluster);

  @override
  List<Object?> get props => [
        this.exerciseName,
        this.date,
        this.setNum,
        this.reps,
        this.weight,
        this.holdTime,
        this.band,
        this.tempo,
        this.tool,
        this.rest,
        this.cluster
      ];
}
