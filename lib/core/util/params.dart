import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final String? exerciseName;
  final DateTime? timestamp;
  final int? setNum;
  final int? reps;
  final double? weight;
  final int? holdTime;
  final String? band;
  final String? tempo;
  final String? tool;
  final int? rest;
  final String? cluster;

  Params({
    this.setNum,
    this.reps,
    this.weight,
    this.holdTime,
    this.band,
    this.tempo,
    this.tool,
    this.rest,
    this.cluster,
    this.exerciseName,
    this.timestamp,
  });

  @override
  List<Object?> get props => [
        this.setNum,
        this.reps,
        this.weight,
        this.holdTime,
        this.band,
        this.tempo,
        this.tool,
        this.rest,
        this.cluster,
        this.exerciseName,
        this.timestamp,
      ];
}
