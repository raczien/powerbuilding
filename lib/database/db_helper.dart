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
    db.execute(
      'CREATE TABLE IF NOT EXISTS cardio_workout(ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, duration INTEGER)',
    );
    print('Created');
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<void> truncate() async {
    final db = await DBHelper.database();
    db.execute('DELETE FROM workout_exercises');
    db.execute('UPDATE SQLITE_SEQUENCE SET SEQ=0');
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<List<Map<String, dynamic>>> getSpecificData(
      String table, String name) async {
    final db = await DBHelper.database();
    return db.rawQuery(
        'SELECT SUM(weight)/(select COUNT(*) FROM ) FROM workout_exercises');
  }
}
