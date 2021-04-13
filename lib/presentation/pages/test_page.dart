// A page purely to test functions
// TODO: delete before release
import 'package:calisthenics_logger_2/data/datasources/database/database_helper.dart';
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
              int i = await DatabaseHelper.instance.insert({
                DatabaseHelper.name: 'Pull up',
                DatabaseHelper.timestamp: '20210413164012',
                DatabaseHelper.setNum: 1,
                DatabaseHelper.reps: 3,
                DatabaseHelper.rest: 30
              });

              print('the inserted id is $i');
            },
            child: Text('Add'),
          ),
          ElevatedButton(
            onPressed: () async {
              List<Map<String, dynamic>> queryRows =
                  await DatabaseHelper.instance.queryAll();
              print(queryRows);
            },
            child: Text('Load'),
          ),
          ElevatedButton(
            onPressed: () async {
              int rowsUpdated = await DatabaseHelper.instance.update(
                  {DatabaseHelper.id: 1, DatabaseHelper.name: "Human Flag"});
              print(rowsUpdated);
            },
            child: Text('Update'),
          ),
          ElevatedButton(
            onPressed: () async {
              int rowsEffected = await DatabaseHelper.instance.delete(2);
              print(rowsEffected);
            },
            child: Text('Delete'),
          )
        ],
      ),
    );
  }
}
