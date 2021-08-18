import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  getAllGivenNameAndDate(String exerciseName, int unixDate) async {
    _trackedExercises.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc['name']);
        print(doc['setNum']);
        print(doc['timestamp']);
      });
    });
  }
}
