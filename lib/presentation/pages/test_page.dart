// A page purely to test functions
// TODO: delete before release
import 'package:calisthenics_logger_2/core/util/timestamp_converter.dart';
import 'package:calisthenics_logger_2/data/datasources/database/tracked_exercise_db_helper.dart';
import 'package:calisthenics_logger_2/data/models/tracked_exercise_model.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () async {
              int i = await TrackedExerciseDbHelper.insert({
                TrackedExerciseDbHelper.name: 'Pull up',
                TrackedExerciseDbHelper.timestamp:
                    getUnixTimeFromDateTime(DateTime.now()),
                TrackedExerciseDbHelper.setNum: 1,
                TrackedExerciseDbHelper.reps: 3,
                TrackedExerciseDbHelper.rest: 30
              });
            },
            child: Text('Add'),
          ),
          ElevatedButton(
            onPressed: () async {
              List<Map<String, dynamic>> queryRows =
                  await TrackedExerciseDbHelper.queryAll();
              TrackedExerciseModel.fromRows(queryRows);
            },
            child: Text('Load'),
          ),
          ElevatedButton(
            onPressed: () async {
              int rowsUpdated = await TrackedExerciseDbHelper.update({
                TrackedExerciseDbHelper.id: 1,
                TrackedExerciseDbHelper.reps: 1100
              });
            },
            child: Text('Update'),
          ),
          ElevatedButton(
            onPressed: () async {
              int rowsEffected = await TrackedExerciseDbHelper.delete(2);
            },
            child: Text('Delete'),
          )
        ],
      ),
    );
  }
}
