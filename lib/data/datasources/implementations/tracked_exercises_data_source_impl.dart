import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/data/datasources/database/tracked_exercise_db_helper.dart';
import 'package:calisthenics_logger_2/data/datasources/interfaces/tracked_exercise_data_source.dart';
import 'package:calisthenics_logger_2/data/models/tracked_exercise_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TrackedExerciseDataSource)
class TrackedExerciseDataSourceImpl implements TrackedExerciseDataSource {
  final TrackedExerciseDbHelper dbHelper;

  TrackedExerciseDataSourceImpl({required this.dbHelper});
  @override
  Future<TrackedExerciseModel> getSpecificTrackedExerciseOnDate(
      String exerciseName, DateTime date) async {
    List<Map<String, dynamic>> queryRows = await dbHelper
        .queryAllGivenNameAndDate(exerciseName, getUnixTimeFromDateTime(date));
    return TrackedExerciseModel.fromRows(queryRows);
  }
}
