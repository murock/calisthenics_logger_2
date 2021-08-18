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
}
