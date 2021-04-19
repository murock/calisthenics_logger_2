import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';

class CollateTrackedExerciseData {
  late String _exerciseName;
  late DateTime _date;
  List<TrackedExerciseRow> _trackedExerciseRows = [];
  Map<String, bool> _populatedFields = new Map();
  List<Map<String, dynamic>> _currentExerciseSets = [];

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
    this._date = getDateTimeFromUnix(firstSet['_timestamp']);
    this._trackedExerciseRows = [];
    this._populatedFields.clear();
    this._currentExerciseSets.clear();
  }

  void _populateRestOfData(List<Map<String, dynamic>> exerciseData) {
    exerciseData.forEach((workoutSet) {
      if (_isNewDate(getDateTimeFromUnix(workoutSet['_timestamp'])) ||
          _isNewExercise(workoutSet['_name'])) {
        this._populateTrackedExerciseRows(this._currentExerciseSets);
        this._saveTrackedExercise();
        this._populateInitialData(workoutSet);
      }
      this._updatePopulatedFields(workoutSet);
      this._currentExerciseSets.add(workoutSet);
    });
    // Final save on the last sets of the data
    this._populateTrackedExerciseRows(this._currentExerciseSets);
    this._saveTrackedExercise();
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
      // -3 as id, name and timestamp are not counted
      numPopulatedFields: this._populatedFields.length - 3,
      exerciseName: this._exerciseName,
      date: this._date,
      rows: this._trackedExerciseRows,
    );
    trackedExercises.add(trackedExercise);
  }

  void _updatePopulatedFields(Map<String, dynamic> workoutSetFields) {
    workoutSetFields.forEach((key, value) {
      if (value != null) {
        this._populatedFields[key] = true;
      }
    });
  }

  void _populateTrackedExerciseRows(
      List<Map<String, dynamic>> currentExerciseSets) {
    currentExerciseSets.forEach((workoutSet) {
      this._insertTrackedExerciseRow(workoutSet);
    });
  }

  void _insertTrackedExerciseRow(Map<String, dynamic> workoutSetFields) {
    _trackedExerciseRows.add(
      new TrackedExerciseRow(
        setNum: _extractStringFromNumRowElement(workoutSetFields['_setNum']),
        reps: this._getNumFieldValue('_reps', workoutSetFields),
        weight: this._getNumFieldValue('_weight', workoutSetFields),
        holdTime: this._getNumFieldValue('_holdTime', workoutSetFields),
        band: this._getStringFieldValue('_band', workoutSetFields),
        tempo: this._getStringFieldValue('_tempo', workoutSetFields),
        tool: this._getStringFieldValue('_tool', workoutSetFields),
        rest: this._getNumFieldValue('_rest', workoutSetFields),
        cluster: this._getStringFieldValue('_cluster', workoutSetFields),
      ),
    );
  }

  String _getNumFieldValue(String key, Map<String, dynamic> workoutSetFields) {
    if (this._populatedFields[key] != null && this._populatedFields[key]!) {
      return _extractStringFromNumRowElement(workoutSetFields[key]);
    } else {
      return '';
    }
  }

  static String _extractStringFromNumRowElement(num? element) {
    String result = '-';
    if (element != null) {
      result = element.toString();
    }
    return result;
  }

  String _getStringFieldValue(
      String key, Map<String, dynamic> workoutSetFields) {
    if (this._populatedFields[key] != null && this._populatedFields[key]!) {
      return _extractStringFromStringRowElement(workoutSetFields[key]);
    } else {
      return '';
    }
  }

  static String _extractStringFromStringRowElement(String? element) {
    String result = '-';
    if (element != null) {
      result = element;
    }
    return result;
  }
}
