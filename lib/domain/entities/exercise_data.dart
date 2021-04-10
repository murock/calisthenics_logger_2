import 'package:equatable/equatable.dart';

class ExerciseData extends Equatable {
  final String exerciseName;
  final int numPopulatedFields;
  final List<ExerciseRowData> rowData;
  final DateTime date;

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

  ExerciseRowData(
      {required this.setNum,
      required this.reps,
      required this.weight,
      required this.band,
      required this.tool});
}
