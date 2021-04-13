import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataHelper {
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
  DataHelper._privateConstructor();
  static final DataHelper instance = DataHelper._privateConstructor();

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

  Future _onCreate(Database db, int version) {
    db.query('''
      CREATE TABLE $_trackedTableName(
      $id INTEGER PRIMARY KEY,
      $name TEXT NOT NULL,
      $timestamp TEXT NOT NULL,
      $setNum INTEGER,
      $reps INTEGER,
      $weight REAL,
      $holdTime INTEGER,
      $band TEXT NOT NULL,
      $tempo TEXT NOT NULL,
      $tool TEXT NOT NULL,
      $rest INTEGER,
      $cluster TEXT NOT NULL)      
      ''');
  }

  Future<int> insert(Map<String,dynamic> row) async {
    Database db
  }
}
