import 'package:calisthenics_logger_2/data/datasources/implementations/tracked_exercises_data_source_impl.dart';
import 'package:calisthenics_logger_2/data/datasources/interfaces/tracked_exercise_data_source.dart';
import 'package:calisthenics_logger_2/data/repos/tracked_exercise_repo_impl.dart';
import 'package:calisthenics_logger_2/domain/repos/tracked_exercise_repo.dart';
import 'package:calisthenics_logger_2/domain/usecases/get_specific_tracked_exercise_on_date.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:get_it/get_it.dart';

// sl = service locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Tracked Exercises
  // Bloc - Factory means can have more than 1 instance. Useful for objects where you need to dispose of things like streams
  sl.registerFactory(() => TrackedExerciseBloc(
        getSpecificTrackedExerciseOnDate: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetSpecificTrackedExerciseOnDate(sl()));

  // Repo
  sl.registerLazySingleton<TrackedExerciseRepo>(
    () => TrackedExerciseRepoImpl(
      trackedExerciseDataSource: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<TrackedExerciseDataSource>(
    () => TrackedExerciseDataSourceImpl(),
  );
}
