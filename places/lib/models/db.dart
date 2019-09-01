import 'package:sqflite/sqflite.dart' as sqf;
import 'package:path/path.dart' as path;

enum Table {
  Places,
}

class Db {
  static Future<void> insert(Table table, Map<String, dynamic> data) async {
    final db = await Db._open();
    await db.insert(_table(table), data,
        conflictAlgorithm: sqf.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> query(Table table) async {
    final db = await Db._open();
    return db.query(_table(table));
  }

  static Future<sqf.Database> _open() async {
    final dbPath = await sqf.getDatabasesPath();
    return sqf.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: _schema,
      version: 1,
    );
  }

  static Future<void> _schema(sqf.Database db, int ver) {
    return db.execute(
      'CREATE TABLE places('
      'id TEXT PRIMARY KEY,'
      'title TEXT,'
      'image TEXT'
      ')',
    );
  }

  static String _table(Table table) {
    return table.toString().toLowerCase().substring('Table'.length + 1);
  }
}
