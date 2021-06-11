// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasources/database/tracked_exercise_db_helper.dart' as _i4;
import 'data/datasources/implementations/tracked_exercises_data_source_impl.dart'
    as _i6;
import 'data/datasources/interfaces/tracked_exercise_data_source.dart' as _i5;
import 'data/repos/tracked_exercise_repo_impl.dart' as _i8;
import 'domain/repos/tracked_exercise_repo.dart' as _i7;
import 'domain/usecases/get_exercise.dart' as _i3;
import 'domain/usecases/get_specific_tracked_exercise_on_date.dart' as _i9;
import 'presentation/bloc/tracked_exercise_bloc.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.GetExercise>(() => _i3.GetExercise());
  gh.lazySingleton<_i4.TrackedExerciseDbHelper>(
      () => _i4.TrackedExerciseDbHelper());
  gh.factory<_i5.TrackedExerciseDataSource>(() =>
      _i6.TrackedExerciseDataSourceImpl(
          dbHelper: get<_i4.TrackedExerciseDbHelper>()));
  gh.factory<_i7.TrackedExerciseRepo>(() => _i8.TrackedExerciseRepoImpl(
      trackedExerciseDataSource: get<_i5.TrackedExerciseDataSource>()));
  gh.lazySingleton<_i9.GetSpecificTrackedExerciseOnDate>(() =>
      _i9.GetSpecificTrackedExerciseOnDate(get<_i7.TrackedExerciseRepo>()));
  gh.factory<_i10.TrackedExerciseBloc>(() => _i10.TrackedExerciseBloc(
      getSpecificTrackedExerciseOnDate:
          get<_i9.GetSpecificTrackedExerciseOnDate>()));
  return get;
}
