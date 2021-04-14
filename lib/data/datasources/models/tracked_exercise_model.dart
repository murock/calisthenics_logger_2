import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';

class TrackedExerciseModel extends TrackedExercise {
  TrackedExerciseModel({
    required int numPopulatedFields,
    required String exerciseName,
    required DateTime date,
    required List<TrackedExerciseRow> rows,
  }) : super(
          numPopulatedFields: numPopulatedFields,
          exerciseName: exerciseName,
          date: date,
          rows: rows,
        );

  factory TrackedExerciseModel.fromRows(List<Map<String, dynamic>> rows) {
    if (rows.length > 0) {
      Map<String, dynamic> firstRow = rows[0];
      return TrackedExerciseModel(
          numPopulatedFields: _getNumPopulatedFields(rows),
          exerciseName: _getExerciseName(firstRow),
          date: _getDate(firstRow),
          rows: _getTrackedExerciseRows(rows));
    } else {
      return new TrackedExerciseModel(
        numPopulatedFields: 0,
        exerciseName: '',
        date: DateTime.now(),
        rows: [],
      );
    }
  }

  static int _getNumPopulatedFields(List<Map<String, dynamic>> rows) {
    // start at -3 as we don't want to count '_id','_timestamp' or '_name' field
    int numPopulatedFields = -3;
    rows.forEach((trackedExercise) {
      int numRowPopFields = -3;
      trackedExercise.forEach((key, value) {
        value ?? numRowPopFields++;
      });
      if (numRowPopFields > numPopulatedFields) {
        numPopulatedFields = numRowPopFields;
      }
    });

    print('num pop fields is $numPopulatedFields');
    return numPopulatedFields;
  }

  static String _getExerciseName(Map<String, dynamic> row) {
    String exerciseName = '';
    if (row.containsKey('_name')) {
      exerciseName = row['_name'];
      print('exercise name is $exerciseName');
    }
    return exerciseName;
  }

  static DateTime _getDate(Map<String, dynamic> row) {
    DateTime date = DateTime.now();
    if (row.containsKey('_timestamp')) {
      int unixTimestamp = row['_timestamp'] * 1000;
      date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp);
      print('date is $date');
    }
    return date;
  }

  // TODO: create another function to loop through the rows then call getTrackedExerciseRows and _getNumPopulatedFields from there?
  static List<TrackedExerciseRow> _getTrackedExerciseRows(
      List<Map<String, dynamic>> rows) {
    List<TrackedExerciseRow> trackedExerciseRows = [];

    rows.forEach((trackedExercise) {
      new TrackedExerciseRow(setNum: trackedExercise['_setNum'])
    });
    return trackedExerciseRows;
  }
}
