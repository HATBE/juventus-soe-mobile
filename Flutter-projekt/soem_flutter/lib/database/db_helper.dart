import 'package:soem_flutter/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/measurement.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'data.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE measurement (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            heightCm REAL,
            weightKg REAL,
            bmi REAL,
            date TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE user (
            username TEXT PRIMARY KEY
          )
        ''');

        await db.insert('user', {'username': '<anonymous>'});
      },
    );
  }

  Future<void> insertMeasurement(Measurement m) async {
    final database = await db;
    await database.insert('measurement', m.toMap());
  }

  Future<List<Measurement>> getMeasurements(String username) async {
    final database = await db;
    final maps = await database.query(
      'measurement',
      where: 'username = ?',
      whereArgs: [username],
      orderBy: 'date DESC',
    );
    return maps.map((e) => Measurement.fromMap(e)).toList();
  }

  Future<void> insertUser(AppUser user) async {
    final dbClient = await db;
    await dbClient.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  // Alle Benutzer laden
  Future<List<AppUser>> getUsers() async {
    final dbClient = await db;
    final result = await dbClient.query('user');
    return result.map((map) => AppUser.fromMap(map)).toList();
  }
}
