import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:dartz/dartz.dart';

abstract class TrackedExerciseRepo {
  Future<Either<Failure, TrackedExercise>> getAllExerciseData();
}

// abstract class NumberTriviaRepository {
//   Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
//   Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
// }