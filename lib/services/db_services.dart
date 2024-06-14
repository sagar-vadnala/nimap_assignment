import 'dart:async';
import 'package:nimap_assignment/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  static Database? _database;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'record_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE records(
        id INTEGER PRIMARY KEY,
        title TEXT,
        shortDescription TEXT,
        collectedValue INTEGER,
        totalValue INTEGER,
        startDate TEXT,
        endDate TEXT,
        mainImageURL TEXT
      )
    ''');
  }

  Future<void> insertRecord(ProjectRecord record) async {
    final db = await database;
    await db.insert('records', record.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ProjectRecord>> fetchRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('records');
    return List.generate(maps.length, (i) {
      return ProjectRecord.fromJson(maps[i]);
    });
  }
}
