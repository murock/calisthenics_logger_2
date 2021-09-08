import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:dartz/dartz.dart';

abstract class TrackedExerciseRepo {
  Future<Either<Failure, GroupedTrackedExercises>>
      getSpecificTrackedExerciseOnDate(String? exercise, DateTime? date);
  Either<Failure, Stream<GroupedTrackedExercises>>
      getSpecificTrackedExerciseOnDateStream(String? exercise, DateTime? date);

  Future<Either<Failure, bool>> addTrackedExercise(
      String? name,
      DateTime? timestamp,
      int? setNum,
      int? reps,
      double? weight,
      int? holdTime,
      String? band,
      String? tempo,
      String? tool,
      int? rest,
      String? cluster);
}
