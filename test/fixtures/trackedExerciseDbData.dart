import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';

List<Map<String, dynamic>> regularData = [
  {
    '_id': 1,
    '_name': 'Pull up',
    '_timestamp': 1618415024,
    '_setNum': 1,
    '_reps': 10,
    '_weight': null,
    '_holdTime': null,
    '_band': 'red',
    '_tempo': null,
    '_tool': null,
    '_rest': null,
    '_cluster': null
  },
  {
    '_id': 2,
    '_name': 'Pull up',
    '_timestamp': 1618415124,
    '_setNum': 2,
    '_reps': 10,
    '_weight': null,
    '_holdTime': null,
    '_band': null,
    '_tempo': null,
    '_tool': null,
    '_rest': null,
    '_cluster': null
  },
  {
    '_id': 3,
    '_name': 'Pull up',
    '_timestamp': 1618415500,
    '_setNum': 3,
    '_reps': 8,
    '_weight': null,
    '_holdTime': null,
    '_band': null,
    '_tempo': null,
    '_tool': null,
    '_rest': null,
    '_cluster': null
  },
  {
    '_id': 4,
    '_name': 'Human Flag',
    '_timestamp': 1618415924,
    '_setNum': 1,
    '_reps': null,
    '_weight': null,
    '_holdTime': 10,
    '_band': null,
    '_tempo': null,
    '_tool': null,
    '_rest': null,
    '_cluster': null
  },
];

List<TrackedExerciseRow> regularDataTrackExRowsPullUp = [
  TrackedExerciseRow(
    setNum: '1',
    reps: '10',
    band: 'red',
  ),
  TrackedExerciseRow(
    setNum: '2',
    reps: '10',
  ),
  TrackedExerciseRow(
    setNum: '3',
    reps: '8',
  )
];

List<TrackedExerciseRow> regularDataTrackExRowsHumanFlag = [
  TrackedExerciseRow(setNum: '1', holdTime: '10'),
];

List<TrackedExercise> regularDataTrackExs = [
  new TrackedExercise(
    numPopulatedFields: 4,
    exerciseName: 'Pull Up',
    date: new DateTime(2021, 04, 14),
    rows: regularDataTrackExRowsPullUp,
  ),
  new TrackedExercise(
    numPopulatedFields: 2,
    exerciseName: 'Human Flag',
    date: new DateTime(2021, 04, 14),
    rows: regularDataTrackExRowsHumanFlag,
  )
];

GroupedTrackedExercises regularDataGroupTrackEx =
    new GroupedTrackedExercises(trackedExercises: regularDataTrackExs);
