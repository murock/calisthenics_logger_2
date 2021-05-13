// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasources/implementations/tracked_exercises_data_source_impl.dart'
    as _i5;
import 'data/datasources/interfaces/tracked_exercise_data_source.dart' as _i4;
import 'data/repos/tracked_exercise_repo_impl.dart' as _i7;
import 'domain/repos/tracked_exercise_repo.dart' as _i6;
import 'domain/usecases/get_specific_tracked_exercise_on_date.dart' as _i8;
import 'presentation/bloc/tracked_exercise_bloc.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.TrackedExerciseBloc>(() => _i3.TrackedExerciseBloc());
  gh.factory<_i4.TrackedExerciseDataSource>(
      () => _i5.TrackedExerciseDataSourceImpl());
  gh.factory<_i6.TrackedExerciseRepo>(() => _i7.TrackedExerciseRepoImpl(
      trackedExerciseDataSource: get<_i4.TrackedExerciseDataSource>()));
  gh.lazySingleton<_i8.GetSpecificTrackedExerciseOnDate>(() =>
      _i8.GetSpecificTrackedExerciseOnDate(get<_i6.TrackedExerciseRepo>()));
  return get;
}
