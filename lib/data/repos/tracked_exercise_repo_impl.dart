import '../../core/error/exceptions/database_exception.dart';
import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/data/datasources/interfaces/tracked_exercise_data_source.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/repos/tracked_exercise_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TrackedExerciseRepo)
class TrackedExerciseRepoImpl implements TrackedExerciseRepo {
  final TrackedExerciseDataSource trackedExerciseDataSource;

  TrackedExerciseRepoImpl({required this.trackedExerciseDataSource});
  @override
  Future<Either<Failure, GroupedTrackedExercises>>
      getSpecificTrackedExerciseOnDate(
          String? exerciseName, DateTime? date) async {
    if (exerciseName == null || date == null) {
      return Left(DatabaseFailure(
          'Attempted to get all tracked exercises with null exercise name or null date'));
    }
    try {
      final trackedExercise = await trackedExerciseDataSource
          .getSpecificTrackedExerciseOnDate(exerciseName, date);
      return Right(trackedExercise);
    } on DatabaseException {
      return Left(
        DatabaseFailure(
          'Problem retrieving all exercises given an exercise name: $exerciseName and date: $date',
        ),
      );
    }
  }

  @override
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
      String? cluster) async {
    if (name == null || timestamp == null || setNum == null) {
      return Left(DatabaseFailure(
          'Attempted to add tracked exercise with null exercise name, null setNum or null date'));
    }
    try {
      return Right(await trackedExerciseDataSource.addTrackedExercise(
          name,
          timestamp,
          setNum,
          reps,
          weight,
          holdTime,
          band,
          tempo,
          tool,
          rest,
          cluster));
    } on DatabaseException {
      return Left(
        DatabaseFailure(
          'Problem adding tracked exercise $name',
        ),
      );
    }
    throw UnimplementedError();
  }
}
