import 'package:calisthenics_logger_2/core/error/exceptions.dart';
import 'package:calisthenics_logger_2/core/error/failures.dart';
import 'package:calisthenics_logger_2/data/datasources/interfaces/tracked_exercise_data_source.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/domain/repos/tracked_exercise_repo.dart';
import 'package:dartz/dartz.dart';

class TrackedExerciseRepoImpl implements TrackedExerciseRepo {
  final TrackedExerciseDataSource trackedExerciseDataSource;

  TrackedExerciseRepoImpl({required this.trackedExerciseDataSource});
  @override
  Future<Either<Failure, TrackedExercise>> getSpecificTrackedExerciseOnDate(
      String? exerciseName, DateTime? date) async {
    if (exerciseName == null || date == null) {
      return Left(DatabaseFailure(
          'Attempted to get all tracked exercises with null exercise name or null date'));
    }
    try {} on DatabaseException {
      return Left(DatabaseFailure(
        'Problem retrieving all exercises given an exercise name and date',
      ));
    }
    // return trackedExerciseDataSource.getSpecificTrackedExerciseOnDate(exerciseName, date);
  }
}

//     try {
//       final remoteTrivia = await getConcreteOrRandom();
//       localDataSource.cacheNumberTrivia(remoteTrivia);
//       return Right(remoteTrivia);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   } else {
//     try {
//       return Right(await localDataSource.getLastNumberTrivia());
//     } on CacheException {
//       return Left(CacheFailure());
//     }
//   }
// }
