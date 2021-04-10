import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/domain/entities/exercise_data.dart';
import 'package:dartz/dartz.dart';

abstract class ExerciseRepo {
  Future<Either<Failure, ExerciseData>> getAllExerciseData();
}

// abstract class NumberTriviaRepository {
//   Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
//   Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
// }
