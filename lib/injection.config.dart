// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasources/database/tracked_exercise_db_helper.dart' as _i5;
import 'data/datasources/implementations/tracked_exercises_data_source_impl.dart'
    as _i7;
import 'data/datasources/interfaces/tracked_exercise_data_source.dart' as _i6;
import 'data/repos/tracked_exercise_repo_impl.dart' as _i9;
import 'domain/repos/exercise_repo.dart' as _i4;
import 'domain/repos/tracked_exercise_repo.dart' as _i8;
import 'domain/usecases/get_exercise.dart' as _i3;
import 'domain/usecases/get_specific_tracked_exercise_on_date.dart' as _i10;
import 'presentation/bloc/tracked_exercise_bloc.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.GetExercise>(
      () => _i3.GetExercise(get<_i4.ExerciseRepo>()));
  gh.lazySingleton<_i5.TrackedExerciseDbHelper>(
      () => _i5.TrackedExerciseDbHelper());
  gh.factory<_i6.TrackedExerciseDataSource>(() =>
      _i7.TrackedExerciseDataSourceImpl(
          dbHelper: get<_i5.TrackedExerciseDbHelper>()));
  gh.factory<_i8.TrackedExerciseRepo>(() => _i9.TrackedExerciseRepoImpl(
      trackedExerciseDataSource: get<_i6.TrackedExerciseDataSource>()));
  gh.lazySingleton<_i10.GetSpecificTrackedExerciseOnDate>(() =>
      _i10.GetSpecificTrackedExerciseOnDate(get<_i8.TrackedExerciseRepo>()));
  gh.factory<_i11.TrackedExerciseBloc>(() => _i11.TrackedExerciseBloc(
      getSpecificTrackedExerciseOnDate:
          get<_i10.GetSpecificTrackedExerciseOnDate>()));
  return get;
}
