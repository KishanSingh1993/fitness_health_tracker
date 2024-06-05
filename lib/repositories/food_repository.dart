import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/food.dart';

class FoodRepository {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'food_database.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE foods(id INTEGER PRIMARY KEY, name TEXT, calories INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertFood(Food food) async {
    final db = await database;
    await db.insert(
      'foods',
      food.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Food>> getFoods() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('foods');
    return List.generate(maps.length, (i) {
      return Food.fromMap(maps[i]);
    });
  }
}
