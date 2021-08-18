import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/data/models/helpers/collate_tracked_exercise_snapshot_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TrackedExerciseDb {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _trackedExercises;

  TrackedExerciseDb() {
    User? user = _auth.currentUser;
    if (user != null && user.email != null) {
      String email = user.email!;
      _trackedExercises =
          _firestore.collection('users/$email/$TRACKED_EXERCISES');
      print(email);
    }
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getAllGivenNameAndDate(
      String exerciseName, int unixDate) async {
    List<QueryDocumentSnapshot<Object?>> result = [];
    await _trackedExercises
        .where('name', isEqualTo: exerciseName)
        .where('timestamp', isEqualTo: unixDate)
        .get()
        .then((QuerySnapshot querySnapshot) {
      result = querySnapshot.docs;
      querySnapshot.docs.forEach((doc) {
        print(doc['name']);
        print(doc['setNum']);
        print(doc['timestamp']);
      });
    });
    // TODO: remove this line
    CollateTrackedExerciseSnapshotData snapshotData =
        CollateTrackedExerciseSnapshotData(result);
    return result;
  }
}
