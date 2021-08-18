import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CollateTrackedExerciseSnapshotData {
  List<TrackedExercise> trackedExercises = [];

  Map<String, bool> _populatedFields = new Map();
  List<TrackedExerciseRow> _rows = [];
  String _exerciseName = '';
  DateTime _date = DateTime.now();

  CollateTrackedExerciseSnapshotData(
      List<QueryDocumentSnapshot<Object?>> snapshots) {
    if (snapshots.length > 0) {
      _populateInitialData(snapshots[0]);
      _populateTrackedExercises(snapshots);
    } else {
      return;
    }
  }

  void _populateInitialData(QueryDocumentSnapshot<Object?> firstSet) {
    this._exerciseName = firstSet['name'];
    this._date = getDateTimeFromUnix(firstSet['timestamp']);
    this._rows = [];
    this._populatedFields.clear();
  }

  void _populateTrackedExercises(
      List<QueryDocumentSnapshot<Object?>> snapshots) {
    List<QueryDocumentSnapshot<Object?>> currentSets = [];

    _exerciseName = snapshots[0].get('name');
    DateTime timestampDate = getDateTimeFromUnix(snapshots[0].get('timestamp'));
    _date =
        DateTime(timestampDate.year, timestampDate.month, timestampDate.day);
    snapshots.forEach((doc) {
      if (_isNewDay(getDateTimeFromUnix(doc['timestamp'])) ||
          _isNewExercise(doc['name'])) {
        this._populateRows(currentSets);
        this._saveTrackedExercise();
        this._populateInitialData(doc);
      }
      this._updatePopulatedFields(doc);
      currentSets.add(doc);
    });
    this._populateRows(currentSets);
    this._saveTrackedExercise();
  }

  bool _isNewDay(DateTime dateToCheck) {
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
      rows: this._rows,
    );
    print('pop fields ' + trackedExercise.numPopulatedFields.toString());
    print('name ' + trackedExercise.exerciseName);
    trackedExercise.rows.forEach((element) {
      print(element.setNum);
      print(element.reps);
    });
    trackedExercises.add(trackedExercise);
  }

  void _updatePopulatedFields(QueryDocumentSnapshot<Object?> doc) {
    Map data = (doc.data() as Map);
    data.forEach((key, value) {
      if (value != null) {
        this._populatedFields[key] = true;
      }
    });
  }

  void _populateRows(List<QueryDocumentSnapshot<Object?>> currentSets) {
    currentSets.forEach((setData) {
      _insertRow(setData);
    });
  }

  void _insertRow(QueryDocumentSnapshot setData) {
    _rows.add(new TrackedExerciseRow(
      setNum: _extractStringFromNumRowElement(setData['setNum']),
      reps: _extractStringFromNumRowElement(setData['reps']),
    ));
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
