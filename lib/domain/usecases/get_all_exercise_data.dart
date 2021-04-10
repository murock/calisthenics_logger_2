import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/core/util/no_params.dart';
import 'package:calisthenics_logger_2/core/util/use_case.dart';
import 'package:calisthenics_logger_2/domain/entities/exercise_data.dart';
import 'package:calisthenics_logger_2/domain/repos/exercise_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllExerciseData implements UseCase<ExerciseData, NoParams> {
  final ExerciseRepo repo;

  GetAllExerciseData(this.repo);

  @override
  Future<Either<Failure, ExerciseData>> call(NoParams params) async {
    return await this.repo.getAllExerciseData();
  }
}
