import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/core/util/params.dart';
import 'package:calisthenics_logger_2/core/util/use_case.dart';
import 'package:calisthenics_logger_2/domain/entities/exercise.dart';
import 'package:calisthenics_logger_2/domain/repos/exercise_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetExercise implements UseCase<Exercise, Params> {
  final ExerciseRepo repo;

  GetExercise(this.repo);

  @override
  Future<Either<Failure, Exercise>> call(Params params) async {
    return await this.repo.getExercise(params.exerciseName);
  }
}
