import 'package:equatable/equatable.dart';

// Holds all saved workout data with each entry being a specific exercise on a specific day
class GroupedTrackedExercises extends Equatable {
  final List<TrackedExercise> trackedExercises;

  GroupedTrackedExercises({required this.trackedExercises});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// Represents a group of sets for 1 exercise on a specific day
class TrackedExercise {
  final int numPopulatedFields;
  final String exerciseName;
  final DateTime date;
  final List<TrackedExerciseRow> rows;

  TrackedExercise(
      {required this.numPopulatedFields,
      required this.exerciseName,
      required this.date,
      required this.rows});
}

// Represents one set
class TrackedExerciseRow {
  final String setNum;
  final String reps;
  final String weight;
  final String holdTime;
  final String band;
  final String tempo;
  final String tool;
  final String rest;
  final String cluster;

  TrackedExerciseRow({
    required this.setNum,
    this.reps = '',
    this.weight = '',
    this.band = '',
    this.tool = '',
    this.holdTime = '',
    this.tempo = '',
    this.rest = '',
    this.cluster = '',
  });
}
