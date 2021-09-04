import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/core/util/params.dart';
import 'package:calisthenics_logger_2/core/util/use_case.dart';
import 'package:calisthenics_logger_2/domain/repos/tracked_exercise_repo.dart';
import 'package:dartz/dartz.dart';

class AddTrackedExercise implements UseCase<bool, Params> {
  final TrackedExerciseRepo repo;

  AddTrackedExercise(this.repo);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await this.repo.addTrackedExercise(
        params.exerciseName,
        params.timestamp,
        params.setNum,
        params.reps,
        params.weight,
        params.holdTime,
        params.band,
        params.tempo,
        params.tool,
        params.rest,
        params.cluster);
  }
}
