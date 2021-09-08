import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/core/util/params.dart';
import 'package:calisthenics_logger_2/core/util/use_case.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/repos/tracked_exercise_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSpecificTrackedExerciseOnDateStream
    implements StreamUseCase<Stream<GroupedTrackedExercises>, Params> {
  final TrackedExerciseRepo repo;

  GetSpecificTrackedExerciseOnDateStream(this.repo);

  @override
  Either<Failure, Stream<GroupedTrackedExercises>> call(Params params) {
    return this.repo.getSpecificTrackedExerciseOnDateStream(
        params.exerciseName, params.timestamp);
  }
}
