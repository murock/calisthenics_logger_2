import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  final String name;
  final List<String> progressions;
  final List<String> muscleGroups;
  final double weightIncrement;

  final bool repsRecorded;
  final bool weightRecorded;
  final bool holdTimeRecorded;
  final bool bandRecorded;
  final bool tempoRecorded;
  final bool toolRecorded;
  final bool restRecorded;
  final bool clusterRecorded;

  Exercise(
      {required this.name,
      required this.progressions,
      required this.muscleGroups,
      this.weightIncrement = DEFAULT_WEIGHT_INCREMENT,
      this.repsRecorded = false,
      this.weightRecorded = false,
      this.holdTimeRecorded = false,
      this.bandRecorded = false,
      this.tempoRecorded = false,
      this.toolRecorded = false,
      this.restRecorded = false,
      this.clusterRecorded = false});

  @override
  List<Object?> get props => [
        this.name,
        this.progressions,
        this.muscleGroups,
        this.weightIncrement,
        this.repsRecorded,
        this.weightRecorded,
        this.holdTimeRecorded,
        this.bandRecorded,
        this.tempoRecorded,
        this.toolRecorded,
        this.restRecorded,
        this.clusterRecorded
      ];
}
