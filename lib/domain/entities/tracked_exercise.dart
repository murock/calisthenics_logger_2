import 'package:equatable/equatable.dart';

class TrackedExercise extends Equatable {
  final int numPopulatedFields;
  final String exerciseName;
  final DateTime date;
  final List<TrackedExerciseRow> rows;

  TrackedExercise(
      {required this.numPopulatedFields,
      required this.exerciseName,
      required this.date,
      required this.rows});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

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
