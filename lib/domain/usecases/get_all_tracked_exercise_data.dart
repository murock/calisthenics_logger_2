import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/core/util/no_params.dart';
import 'package:calisthenics_logger_2/core/util/use_case.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/repos/tracked_exercise_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllTrackedExerciseData implements UseCase<TrackedExercise, NoParams> {
  final TrackedExerciseRepo repo;

  GetAllTrackedExerciseData(this.repo);

  @override
  Future<Either<Failure, TrackedExercise>> call(NoParams params) async {
    return await this.repo.getAllExerciseData();
  }
}
