import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/data/datasources/database/firestore/tracked_exercise_db.dart';
import 'package:calisthenics_logger_2/data/datasources/interfaces/tracked_exercise_data_source.dart';
import 'package:calisthenics_logger_2/data/models/tracked_exercise_model.dart';
import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TrackedExerciseDataSource)
class TrackedExerciseDataSourceImpl implements TrackedExerciseDataSource {
  final TrackedExerciseDb trackedExerciseDb;

  TrackedExerciseDataSourceImpl({required this.trackedExerciseDb});

  @override
  Stream<TrackedExerciseModel> getSpecificTrackedExerciseOnDateStream(
      String exerciseName, DateTime date) {
    var snapshotStream =
        trackedExerciseDb.getStreamGivenNameAndDate(exerciseName, date);
    // TODO: implement getSpecificTrackedExerciseOnDateStream
    throw UnimplementedError();
  }

  @override
  Future<TrackedExerciseModel> getSpecificTrackedExerciseOnDate(
      String exerciseName, DateTime date) async {
    List<QueryDocumentSnapshot<Object?>> snapshots =
        await trackedExerciseDb.getAllGivenNameAndDate(exerciseName, date);
    return TrackedExerciseModel.fromQueryDocumentSnapshot(snapshots);
  }

  @override
  Future<bool> addTrackedExercise(
      String name,
      DateTime timestamp,
      int setNum,
      int? reps,
      double? weight,
      int? holdTime,
      String? band,
      String? tempo,
      String? tool,
      int? rest,
      String? cluster) async {
    List<TrackedExerciseRow> trackedExerciseRows = [];
    trackedExerciseRows.add(
      TrackedExerciseRow(
          setNum: setNum,
          reps: reps != null ? reps : UNPOPULATED_INT_VALUE,
          weight: weight != null ? weight : UNPOPULATED_DOUBLE_VALUE,
          holdTime: holdTime != null ? holdTime : UNPOPULATED_INT_VALUE,
          band: band != null ? band : '',
          tempo: tempo != null ? tempo : '',
          tool: tool != null ? tool : '',
          rest: rest != null ? rest : UNPOPULATED_INT_VALUE,
          cluster: cluster != null ? cluster : ''),
    );
    List<TrackedExercise> trackedExercises = [];
    trackedExercises.add(TrackedExercise(
        exerciseName: name, date: timestamp, rows: trackedExerciseRows));
    TrackedExerciseModel trackedExerciseModel =
        TrackedExerciseModel(trackedExercises: trackedExercises);
    return await trackedExerciseDb.addTrackedExercise(trackedExerciseModel);
  }
}
