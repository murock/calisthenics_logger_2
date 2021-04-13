import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _dbName = 'loggerDb.db';
  static final _dbVersion = 1;
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

  // Singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    db.execute('''
      CREATE TABLE $_trackedTableName(
      $id INTEGER PRIMARY KEY,
      $name TEXT NOT NULL,
      $timestamp TEXT NOT NULL,
      $setNum INTEGER,
      $reps INTEGER,
      $weight REAL,
      $holdTime INTEGER,
      $band TEXT DEFAULT "" NOT NULL,
      $tempo TEXT DEFAULT "" NOT NULL,
      $tool TEXT DEFAULT "" NOT NULL,
      $rest INTEGER,
      $cluster TEXT DEFAULT "" NOT NULL)      
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(_trackedTableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.database;
    return await db!.query(_trackedTableName);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int idToUpdate = row[id];
    return await db!.update(_trackedTableName, row,
        where: '$id = ?', whereArgs: [idToUpdate]);
  }

  Future<int> delete(int idToDelete) async {
    Database? db = await instance.database;
    return await db!
        .delete(_trackedTableName, where: '$id= ?', whereArgs: [idToDelete]);
  }
}
