import 'dart:io';

import 'package:sqflite/sqflite.dart';

class DataHelper {
  static final _dbName = 'loggerDb.db';
  static final _dbVersion = 1;

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
    Directory directory = await getDatabasesPath();
  }
}
