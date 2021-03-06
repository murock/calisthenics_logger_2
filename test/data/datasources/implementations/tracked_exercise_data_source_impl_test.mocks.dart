// Mocks generated by Mockito 5.0.12 from annotations
// in calisthenics_logger_2/test/data/datasources/implementations/tracked_exercise_data_source_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:calisthenics_logger_2/data/datasources/database/firestore/tracked_exercise_db.dart'
    as _i2;
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [TrackedExerciseDb].
///
/// See the documentation for Mockito's code generation for more information.
class MockTrackedExerciseDb extends _i1.Mock implements _i2.TrackedExerciseDb {
  MockTrackedExerciseDb() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.QueryDocumentSnapshot<Object?>>> getAllGivenNameAndDate(
          String? exerciseName, int? unixDate) =>
      (super.noSuchMethod(
          Invocation.method(#getAllGivenNameAndDate, [exerciseName, unixDate]),
          returnValue: Future<List<_i4.QueryDocumentSnapshot<Object?>>>.value(
              <_i4.QueryDocumentSnapshot<Object?>>[])) as _i3
          .Future<List<_i4.QueryDocumentSnapshot<Object?>>>);
}
