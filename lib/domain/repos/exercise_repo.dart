import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/domain/entities/exercise.dart';
import 'package:dartz/dartz.dart';

abstract class ExerciseRepo {
  Future<Either<Failure, Exercise>> getExercise(String? exerciseName);
}