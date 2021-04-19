import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/core/util/params.dart';
import 'package:calisthenics_logger_2/core/util/use_case.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/repos/tracked_exercise_repo.dart';
import 'package:dartz/dartz.dart';

class GetSpecificTrackedExerciseOnDate
    implements UseCase<GroupedTrackedExercises, Params> {
  final TrackedExerciseRepo repo;

  GetSpecificTrackedExerciseOnDate(this.repo);

  @override
  Future<Either<Failure, GroupedTrackedExercises>> call(Params params) async {
    return await this
        .repo
        .getSpecificTrackedExerciseOnDate(params.exerciseName, params.date);
  }
}
