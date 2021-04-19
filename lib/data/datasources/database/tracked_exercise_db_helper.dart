import 'package:calisthenics_logger_2/data/datasources/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class TrackedExerciseDbHelper {
  static final _trackedTableName = 'trackedExercises';
  static final id = '_id';
  static final name = '_name';
  static final timestamp = '_timestamp';
  static final setNum = '_setNum';
  static final reps = '_reps';
  static final weight = '_weight';
  static final holdTime = '_holdTime';
  static final band = '_band';
  static final tempo = '_tempo';
  static final tool = '_tool';
  static final rest = '_rest';
  static final cluster = '_cluster';

  static final createTableString = '''       
      CREATE TABLE $_trackedTableName(
      $id INTEGER PRIMARY KEY,
      $name TEXT NOT NULL,
      $timestamp INTEGER NOT NULL,
      $setNum INTEGER NOT NULL,
      $reps INTEGER,
      $weight REAL,
      $holdTime INTEGER,
      $band TEXT,
      $tempo TEXT,
      $tool TEXT,
      $rest INTEGER,
      $cluster TEXT)''';

  static Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await DatabaseHelper.instance.database;
    return await db!.insert(_trackedTableName, row);
  }

  static Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await DatabaseHelper.instance.database;
    return await db!.query(_trackedTableName);
  }

  static Future<List<Map<String, dynamic>>> queryAllGivenNameAndDate(
      String name, int timestamp) async {
    Database? db = await DatabaseHelper.instance.database;
    return await db!.query(_trackedTableName);
  }

  static Future<int> update(Map<String, dynamic> row) async {
    Database? db = await DatabaseHelper.instance.database;
    int idToUpdate = row[id];
    return await db!.update(_trackedTableName, row,
        where: '$id = ?', whereArgs: [idToUpdate]);
  }

  static Future<int> delete(int idToDelete) async {
    Database? db = await DatabaseHelper.instance.database;
    return await db!
        .delete(_trackedTableName, where: '$id= ?', whereArgs: [idToDelete]);
  }
}
