import 'package:calisthenics_logger_2/data/datasources/database/tracked_exercise_db_helper.dart';
import 'package:calisthenics_logger_2/data/datasources/interfaces/tracked_exercise_data_source.dart';
import 'package:calisthenics_logger_2/data/datasources/models/tracked_exercise_model.dart';

class TrackedExerciseDataSourceImpl implements TrackedExerciseDataSource {
  @override
  Future<TrackedExerciseModel> getAllTrackedExercises() async {
    List<Map<String, dynamic>> queryRows =
        await TrackedExerciseDbHelper.queryAll();

    // TODO: implement getAllTrackedExercises
    throw UnimplementedError();
  }
}
