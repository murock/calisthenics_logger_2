// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasources/database/firestore/tracked_exercise_db.dart' as _i5;
import 'data/datasources/database/tracked_exercise_db_helper.dart' as _i6;
import 'data/datasources/implementations/tracked_exercises_data_source_impl.dart'
    as _i8;
import 'data/datasources/interfaces/tracked_exercise_data_source.dart' as _i7;
import 'data/repos/tracked_exercise_repo_impl.dart' as _i10;
import 'domain/repos/exercise_repo.dart' as _i4;
import 'domain/repos/tracked_exercise_repo.dart' as _i9;
import 'domain/usecases/add_tracked_exercise_to_storage.dart' as _i11;
import 'domain/usecases/get_exercise.dart' as _i3;
import 'domain/usecases/get_specific_tracked_exercise_on_date.dart' as _i12;
import 'presentation/bloc/tracked_exercise_bloc.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.GetExercise>(
      () => _i3.GetExercise(get<_i4.ExerciseRepo>()));
  gh.lazySingleton<_i5.TrackedExerciseDb>(() => _i5.TrackedExerciseDb());
  gh.lazySingleton<_i6.TrackedExerciseDbHelper>(
      () => _i6.TrackedExerciseDbHelper());
  gh.factory<_i7.TrackedExerciseDataSource>(() =>
      _i8.TrackedExerciseDataSourceImpl(
          trackedExerciseDb: get<_i5.TrackedExerciseDb>()));
  gh.factory<_i9.TrackedExerciseRepo>(() => _i10.TrackedExerciseRepoImpl(
      trackedExerciseDataSource: get<_i7.TrackedExerciseDataSource>()));
  gh.lazySingleton<_i11.AddTrackedExerciseToStorage>(
      () => _i11.AddTrackedExerciseToStorage(get<_i9.TrackedExerciseRepo>()));
  gh.lazySingleton<_i12.GetSpecificTrackedExerciseOnDate>(() =>
      _i12.GetSpecificTrackedExerciseOnDate(get<_i9.TrackedExerciseRepo>()));
  gh.factory<_i13.TrackedExerciseBloc>(() => _i13.TrackedExerciseBloc(
      getSpecificTrackedExerciseOnDate:
          get<_i12.GetSpecificTrackedExerciseOnDate>(),
      addTrackedExercise: get<_i11.AddTrackedExerciseToStorage>()));
  return get;
}
