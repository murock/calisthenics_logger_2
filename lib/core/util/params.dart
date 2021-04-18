import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final String? exerciseName;
  final DateTime? date;

  Params({
    this.exerciseName,
    this.date,
  });

  @override
  List<Object?> get props => [exerciseName, this.date];
}
