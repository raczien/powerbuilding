import 'dart:async';

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'exerciseEntry.db'),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS workout_exercises(ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, sets INTEGER, reps INTEGER, weight INTEGER, day INTEGER, month INTEGER, year INTEGER)',
      );
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.execute(
      'CREATE TABLE IF NOT EXISTS workout_exercises(ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, sets INTEGER, reps INTEGER, weight INTEGER, day INTEGER, month INTEGER, year INTEGER)',
    );
    print('Created');
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
