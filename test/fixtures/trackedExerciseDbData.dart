// import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

// List<Map<String, dynamic>> regularData = [
//   {
//     '_id': 1,
//     '_name': 'Pull Up',
//     '_timestamp': 1618415024,
//     '_setNum': 1,
//     '_reps': 10,
//     '_weight': null,
//     '_holdTime': null,
//     '_band': 'red',
//     '_tempo': null,
//     '_tool': null,
//     '_rest': null,
//     '_cluster': null
//   },
//   {
//     '_id': 2,
//     '_name': 'Pull Up',
//     '_timestamp': 1618415124,
//     '_setNum': 2,
//     '_reps': 10,
//     '_weight': null,
//     '_holdTime': null,
//     '_band': null,
//     '_tempo': null,
//     '_tool': null,
//     '_rest': null,
//     '_cluster': null
//   },
//   {
//     '_id': 3,
//     '_name': 'Pull Up',
//     '_timestamp': 1618415500,
//     '_setNum': 3,
//     '_reps': 8,
//     '_weight': null,
//     '_holdTime': null,
//     '_band': null,
//     '_tempo': null,
//     '_tool': null,
//     '_rest': null,
//     '_cluster': null
//   },
//   {
//     '_id': 4,
//     '_name': 'Human Flag',
//     '_timestamp': 1618415924,
//     '_setNum': 1,
//     '_reps': null,
//     '_weight': null,
//     '_holdTime': 10,
//     '_band': null,
//     '_tempo': null,
//     '_tool': null,
//     '_rest': null,
//     '_cluster': null
//   },
// ];

// List<TrackedExerciseRow> regularDataTrackExRowsPullUp = [
//   TrackedExerciseRow(
//     setNum: '1',
//     reps: '10',
//     band: 'red',
//   ),
//   TrackedExerciseRow(
//     setNum: '2',
//     reps: '10',
//     band: '-',
//   ),
//   TrackedExerciseRow(
//     setNum: '3',
//     reps: '8',
//     band: '-',
//   )
// ];

// List<TrackedExerciseRow> regularDataTrackExRowsHumanFlag = [
//   TrackedExerciseRow(setNum: '1', holdTime: '10'),
// ];

// List<TrackedExercise> regularDataTrackExs = [
//   new TrackedExercise(
//     numPopulatedFields: 3,
//     exerciseName: 'Pull Up',
//     date: new DateTime(2021, 04, 14),
//     rows: regularDataTrackExRowsPullUp,
//   ),
//   new TrackedExercise(
//     numPopulatedFields: 2,
//     exerciseName: 'Human Flag',
//     date: new DateTime(2021, 04, 14),
//     rows: regularDataTrackExRowsHumanFlag,
//   )
// ];

// GroupedTrackedExercises regularDataGroupTrackEx =
//     new GroupedTrackedExercises(trackedExercises: regularDataTrackExs);

// Map<String, dynamic> rawDbRow = {
//   '_id': 1,
//   '_name': 'Pull up',
//   '_timestamp': 16221662,
//   '_setNum': 1,
//   '_reps': 10,
//   '_weight': 20.0,
//   '_holdTime': null,
//   '_band': null,
//   '_tempo': null,
//   '_tool': null,
//   '_rest': 30,
//   '_cluster': null
// };

// List<Map<String, dynamic>> rawDbData = [rawDbRow];

// final fakeFirestore = FakeFirebaseFirestore();

// late QueryDocumentSnapshot<Object?> rawFirestoreRow;
// late List<QueryDocumentSnapshot<Object?>> rawFirestoreData;

// Future<void> populateFakeFirestore() async {
//   await fakeFirestore.collection('tracked_exercises').add({
//     'id': 1,
//     'name': 'Pull Up',
//     'timestamp': 16221662,
//     'setNum': 1,
//     'reps': 10,
//     'weight': 20.0,
//     'holdTime': null,
//     'band': null,
//     'tempo': null,
//     'tool': null,
//     'rest': 30,
//     'cluster': null
//   });
//   CollectionReference trackedExercises =
//       fakeFirestore.collection('tracked_exercises');
//   await trackedExercises
//       .where('name', isEqualTo: 'Pull Up')
//       .get()
//       .then((QuerySnapshot querySnapshot) {
//     rawFirestoreData = querySnapshot.docs;
//   });
//   return;
// }
