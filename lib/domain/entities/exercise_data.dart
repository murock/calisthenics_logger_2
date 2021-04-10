import 'package:equatable/equatable.dart';

class ExerciseData extends Equatable {
  final String exerciseName;
  final int numPopulatedFields;
  final List<ExerciseRowData> rowData;
  final date;

  ExerciseData(
      {required this.exerciseName,
      required this.numPopulatedFields,
      required this.date,
      required this.rowData});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ExerciseRowData {
  final String setNum;
  final String reps;
  final String weight;
  final String band;
  final String tool;

  ExerciseRowData(this.setNum, this.reps, this.weight, this.band, this.tool);
}
