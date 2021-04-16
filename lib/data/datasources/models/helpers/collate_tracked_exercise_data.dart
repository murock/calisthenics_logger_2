import 'package:calisthenics_logger_2/data/datasources/models/tracked_exercise_model.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';

class CollateTrackedExerciseData {
  late String _exerciseName;
  late DateTime _date;
  List<TrackedExerciseRow> _trackedExerciseRows = [];
  // start at -3 as we don't want to count '_id','_timestamp' or '_name' field
  int _numPopulatedFields = -3;

  List<TrackedExercise> trackedExercises = [];

  CollateTrackedExerciseData(List<Map<String, dynamic>> exerciseData) {
    if (exerciseData.length > 0) {
      _populateInitialData(exerciseData[0]);
    } else {
      return;
    }
    _populateRestOfData(exerciseData);
  }

  void _populateInitialData(Map<String, dynamic> firstSet) {
    this._exerciseName = firstSet['_name'];
    this._date = _getDate(firstSet['_timestamp']);
    this._numPopulatedFields = -3;
    this._trackedExerciseRows = [];
  }

  static DateTime _getDate(int unixTime) {
    int unixTimeInMilliseconds = unixTime * 1000;
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimeInMilliseconds);
    DateTime roundedDate =
        new DateTime(dateTime.year, dateTime.month, dateTime.day);
    return roundedDate;
  }

  void _populateRestOfData(List<Map<String, dynamic>> exerciseData) {
    exerciseData.forEach((workoutSet) {
      if (_isNewDate(_getDate(workoutSet['_timestamp'])) ||
          _isNewExercise(workoutSet['_name'])) {
        _saveTrackedExercise();
        _populateInitialData(workoutSet);
      }
      _updateTrackedExerciseRows(workoutSet);
      _updateNumPopulatedFields(workoutSet);
    });
    // Final save on the last sets of the data
    _saveTrackedExercise();
  }

  bool _isNewDate(DateTime dateToCheck) {
    DateTime checkDay =
        new DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if (this._date != checkDay) {
      return true;
    }
    return false;
  }

  bool _isNewExercise(String nameToCheck) {
    if (this._exerciseName != nameToCheck) {
      return true;
    }
    return false;
  }

  void _saveTrackedExercise() {
    TrackedExercise trackedExercise = new TrackedExercise(
      numPopulatedFields: this._numPopulatedFields,
      exerciseName: this._exerciseName,
      date: this._date,
      rows: this._trackedExerciseRows,
    );
    trackedExercises.add(trackedExercise);
  }

  void _updateTrackedExerciseRows(Map<String, dynamic> workoutSetFields) {
    _trackedExerciseRows.add(
      new TrackedExerciseRow(
        setNum: _extractStringFromNumRowElement(workoutSetFields['_setNum']),
        reps: _extractStringFromNumRowElement(workoutSetFields['_reps']),
        weight: _extractStringFromNumRowElement(workoutSetFields['_weight']),
        holdTime:
            _extractStringFromNumRowElement(workoutSetFields['_holdTime']),
        band: workoutSetFields['_band'] ?? '',
        tempo: workoutSetFields['_tempo'] ?? '',
        tool: workoutSetFields['_tool'] ?? '',
        rest: _extractStringFromNumRowElement(workoutSetFields['_rest']),
        cluster: workoutSetFields['_cluster'] ?? '',
      ),
    );
  }

  static String _extractStringFromNumRowElement(num? element) {
    String result = '';
    if (element != null) {
      result = element.toString();
    }
    return result;
  }

  void _updateNumPopulatedFields(Map<String, dynamic> workoutSetFields) {
    int numPopFields = -3;
    workoutSetFields.forEach((key, value) {
      value ?? numPopFields++;
    });
    if (numPopFields > this._numPopulatedFields) {
      this._numPopulatedFields = numPopFields;
    }
  }
}
