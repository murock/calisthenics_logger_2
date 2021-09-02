import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/data/models/helpers/collate_tracked_exercise_data.dart';
import 'package:calisthenics_logger_2/data/models/helpers/collate_tracked_exercise_snapshot_data.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrackedExerciseModel extends GroupedTrackedExercises {
  TrackedExerciseModel({
    required List<TrackedExercise> trackedExercises,
  }) : super(
          trackedExercises: trackedExercises,
        );

  factory TrackedExerciseModel.fromRows(List<Map<String, dynamic>> rows) {
    CollateTrackedExerciseData collatedData =
        new CollateTrackedExerciseData(rows);
    return TrackedExerciseModel(
        trackedExercises: collatedData.trackedExercises);
  }

  factory TrackedExerciseModel.fromQueryDocumentSnapshot(
      List<QueryDocumentSnapshot<Object?>> snapshots) {
    CollateTrackedExerciseSnapshotData collatedData =
        new CollateTrackedExerciseSnapshotData(snapshots);
    return TrackedExerciseModel(
        trackedExercises: collatedData.trackedExercises);
  }

  // TODO: Implement this
  factory TrackedExerciseModel.rowFromJson(Map<String, Object?> json) {
    return TrackedExerciseModel(trackedExercises: []);
  }

  Map<String, Object?> rowToJson() {
    int index = trackedExercises.length - 1;
    int rowIndex = trackedExercises[index].rows.length - 1;
    return {
      'name': trackedExercises[index].exerciseName,
      'timestamp': getUnixTimeFromDateTime(trackedExercises[index].date),
      'setNum': trackedExercises[index].rows[rowIndex].setNum,
      'reps': trackedExercises[index].rows[rowIndex].reps,
      'weight': trackedExercises[index].rows[rowIndex].weight,
      'holdTime': trackedExercises[index].rows[rowIndex].holdTime,
      'band': trackedExercises[index].rows[rowIndex].band,
      'tempo': trackedExercises[index].rows[rowIndex].tempo,
      'tool': trackedExercises[index].rows[rowIndex].tool,
      'rest': trackedExercises[index].rows[rowIndex].rest,
      'cluster': trackedExercises[index].rows[rowIndex].cluster,
    };
  }
}
