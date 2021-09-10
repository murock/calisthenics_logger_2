import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/data/models/tracked_exercise_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TrackedExerciseDb {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _trackedExercises;
  late CollectionReference<TrackedExerciseModel> _trackedExercisesRowRef;

  TrackedExerciseDb() {
    User? user = _auth.currentUser;
    if (user != null && user.email != null) {
      String email = user.email!;
      _trackedExercises =
          _firestore.collection('users/$email/$TRACKED_EXERCISES');
      _trackedExercisesRowRef =
          _trackedExercises.withConverter<TrackedExerciseModel>(
              fromFirestore: (snapshot, _) =>
                  TrackedExerciseModel.rowFromJson(snapshot.data()!),
              toFirestore: (trackedExercises, _) =>
                  trackedExercises.rowToJson());
    }
  }

  Stream<QuerySnapshot> getStreamGivenNameAndDate(
      String exerciseName, DateTime date) {
    int unixStartDay =
        getUnixTimeFromDateTime(new DateTime(date.year, date.month, date.day));
    int unixEndDay = unixStartDay + 86400;
    return _trackedExercises
        .where('name', isEqualTo: exerciseName)
        .where('timestamp', isGreaterThan: unixStartDay)
        .where('timestamp', isLessThan: unixEndDay)
        .snapshots();
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getAllGivenNameAndDate(
      String exerciseName, DateTime date) async {
    int unixStartDay =
        getUnixTimeFromDateTime(new DateTime(date.year, date.month, date.day));
    int unixEndDay = unixStartDay + 86400;
    List<QueryDocumentSnapshot<Object?>> result = [];
    await _trackedExercises
        .where('name', isEqualTo: exerciseName)
        .where('timestamp', isGreaterThan: unixStartDay)
        .where('timestamp', isLessThan: unixEndDay)
        .get()
        .then((QuerySnapshot querySnapshot) {
      result = querySnapshot.docs;
    });
    return result;
  }

  Future<bool> addTrackedExercise(
      TrackedExerciseModel trackedExerciseModel) async {
    bool result = false;
    print('Adding');
    var ref = await _trackedExercisesRowRef
        .add(trackedExerciseModel)
        .then((value) => result = true)
        .catchError((_) => result = false);
    print(result);
    return result;
  }
}
