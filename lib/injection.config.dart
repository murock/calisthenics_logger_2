// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasources/implementations/tracked_exercises_data_source_impl.dart'
    as _i4;
import 'data/datasources/interfaces/tracked_exercise_data_source.dart' as _i3;
import 'data/repos/tracked_exercise_repo_impl.dart' as _i6;
import 'domain/repos/tracked_exercise_repo.dart' as _i5;
import 'domain/usecases/get_specific_tracked_exercise_on_date.dart' as _i7;
import 'presentation/bloc/tracked_exercise_bloc.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.TrackedExerciseDataSource>(
      () => _i4.TrackedExerciseDataSourceImpl());
  gh.factory<_i5.TrackedExerciseRepo>(() => _i6.TrackedExerciseRepoImpl(
      trackedExerciseDataSource: get<_i3.TrackedExerciseDataSource>()));
  gh.lazySingleton<_i7.GetSpecificTrackedExerciseOnDate>(() =>
      _i7.GetSpecificTrackedExerciseOnDate(get<_i5.TrackedExerciseRepo>()));
  gh.factory<_i8.TrackedExerciseBloc>(() => _i8.TrackedExerciseBloc(
      getSpecificTrackedExerciseOnDate:
          get<_i7.GetSpecificTrackedExerciseOnDate>()));
  return get;
}
