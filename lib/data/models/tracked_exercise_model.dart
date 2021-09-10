import 'dart:async';

import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/data/models/helpers/collate_tracked_exercise_snapshot_data.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrackedExerciseModel extends GroupedTrackedExercises {
  TrackedExerciseModel({
    required List<TrackedExercise> trackedExercises,
  }) : super(
          trackedExercises: trackedExercises,
        );

  factory TrackedExerciseModel.fromQueryDocumentSnapshot(
      List<QueryDocumentSnapshot<Object?>> snapshots) {
    CollateTrackedExerciseSnapshotData collatedData =
        new CollateTrackedExerciseSnapshotData(snapshots);
    return TrackedExerciseModel(
        trackedExercises: collatedData.trackedExercises);
  }

  static Stream<TrackedExerciseModel> fromQuerySnapshotStream(
      Stream<QuerySnapshot<Object?>> snapshots) async* {
    yield* snapshots.map((snapshot) =>
        TrackedExerciseModel.fromQueryDocumentSnapshot(snapshot.docs));

    // StreamTransformer<QuerySnapshot<Object?>, TrackedExerciseModel>
    //     _streamTransformer = StreamTransformer<QuerySnapshot<Object?>,
    //         TrackedExerciseModel>.fromHandlers(
    //   handleData:
    //       (QuerySnapshot<Object?> data, EventSink<TrackedExerciseModel> sink) {
    //     var docs = data.docs;
    //     var model = TrackedExerciseModel.fromQueryDocumentSnapshot(docs);
    //     sink.add(model);
    //   },
    //   handleError: (Object error, StackTrace stacktrace, EventSink sink) {
    //     sink.addError('Error getting tracked exercise data $error');
    //   },
    //   handleDone: (EventSink sink) => sink.close(),
    // );
    //return snapshots.transform(_streamTransformer);
    // snapshots.listen((data) {
    //   var docs = data.docs;
    //   var model = TrackedExerciseModel.fromQueryDocumentSnapshot(docs);
    //   print('decrpting the stream');
    //   print(model.trackedExercises[0].rows[0].setNum);
    //   //  yield model;
    // });
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

// class QuerySnapshotTransformer implements StreamTransformer {
//   @override
//   Stream bind(Stream stream) {
//     // TODO: implement bind
//     throw UnimplementedError();
//   }
//
//   @override
//   StreamTransformer<RS, RT> cast<RS, RT>() {
//     // TODO: implement cast
//     throw UnimplementedError();
//   }
//
// }
