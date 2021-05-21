import 'package:calisthenics_logger_2/data/datasources/implementations/tracked_exercises_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  TrackedExerciseDataSourceImpl dataSource = TrackedExerciseDataSourceImpl();

  setUp(() {
    dataSource = TrackedExerciseDataSourceImpl();
  });

  // TODO: Add Tests for the database using ffi to mock sqlflite
  test(
    'should return a list of TrackedExercises when getSpecificTrackedExerciseOnDate is called',
    () async {
      //arrange
      // var db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
      // //act
      // final result = await dataSource.getSpecificTrackedExerciseOnDate(
      //     'Pull Up', new DateTime(2021));
      //assert
    },
  );
}
