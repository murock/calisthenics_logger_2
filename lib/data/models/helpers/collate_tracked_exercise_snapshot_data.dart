import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/data/models/helpers/populated_fields.dart';
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
      this._updatePopulatedFields(doc);
      if (_isNewDay(getDateTimeFromUnix(doc['timestamp'])) ||
          _isNewExercise(doc['name'])) {
        this._populateRows(currentSets);
        this._saveTrackedExercise();
        this._populateInitialData(doc);
      }
      currentSets.add(doc);
    });
    this._populateRows(currentSets);
    this._saveTrackedExercise();
  }

  void _updatePopulatedFields(QueryDocumentSnapshot<Object?> doc) {
    Map data = (doc.data() as Map);
    data.forEach((key, value) {
      if (value != null) {
        this._populatedFields[key] = true;
      }
    });
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
    trackedExercise.rows.forEach((element) {});
    trackedExercises.add(trackedExercise);
  }

  void _populateRows(List<QueryDocumentSnapshot<Object?>> currentSets) {
    currentSets.forEach((setData) {
      _insertRow(setData);
    });
  }

  void _insertRow(QueryDocumentSnapshot setData) {
    _rows.add(new TrackedExerciseRow(
      setNum: _extractStringFromNumRowElement(setData, 'setNum'),
      reps: _extractStringFromNumRowElement(setData, 'reps'),
      weight: _extractStringFromNumRowElement(setData, 'weight'),
      holdTime: _extractStringFromNumRowElement(setData, 'holdTime'),
      band: _extractStringFromStringRowElement(setData, 'band'),
      tempo: _extractStringFromStringRowElement(setData, 'tempo'),
      tool: _extractStringFromStringRowElement(setData, 'tool'),
      rest: _extractStringFromNumRowElement(setData, 'rest'),
      cluster: _extractStringFromStringRowElement(setData, 'cluster'),
    ));
  }

  String _extractStringFromNumRowElement(
      QueryDocumentSnapshot setData, String field) {
    String result = this._populatedFields.containsKey(field) ? '-' : '';
    Map data = (setData.data() as Map);
    if (data.containsKey(field)) {
      num? element = setData[field];
      if (element != null) {
        result = element.toString();
      }
    }
    return result;
  }

  String _extractStringFromStringRowElement(
      QueryDocumentSnapshot setData, String field) {
    String result = this._populatedFields.containsKey(field) ? '-' : '';
    Map data = (setData.data() as Map);
    if (data.containsKey(field)) {
      String? element = setData[field];
      if (element != null) {
        result = element;
      }
    }
    return result;
  }
}
