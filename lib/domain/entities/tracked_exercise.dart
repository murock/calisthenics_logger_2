import 'package:equatable/equatable.dart';

// Holds all saved workout data with each entry being a specific exercise on a specific day
class GroupedTrackedExercises extends Equatable {
  final List<TrackedExercise> trackedExercises;

  GroupedTrackedExercises({required this.trackedExercises});

  @override
  List<Object?> get props => [trackedExercises];
}

// Represents a group of sets for 1 exercise on a specific day
class TrackedExercise extends Equatable {
  final int numPopulatedFields;
  final String exerciseName;
  final DateTime date;
  final List<TrackedExerciseRow> rows;

  TrackedExercise(
      {this.numPopulatedFields = -1,
      required this.exerciseName,
      required this.date,
      required this.rows});

  @override
  List<Object?> get props => [numPopulatedFields, exerciseName, date, rows];
}

// Represents one set
class TrackedExerciseRow extends Equatable {
  final int setNum;
  final int reps;
  final double weight;
  final int holdTime;
  final String band;
  final String tempo;
  final String tool;
  final int rest;
  final String cluster;

  TrackedExerciseRow({
    required this.setNum,
    this.reps = -1,
    this.weight = -1,
    this.band = '',
    this.tool = '',
    this.holdTime = -1,
    this.tempo = '',
    this.rest = -1,
    this.cluster = '',
  });

  @override
  List<Object?> get props =>
      [setNum, reps, weight, holdTime, band, tempo, tool, rest, cluster];
}
