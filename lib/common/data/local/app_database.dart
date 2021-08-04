import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'local_constant.dart';
import 'model/cache_country.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB(DB_NAME);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'TEXT PRIMARY KEY';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    await db.execute('''
CREATE TABLE $tableName ( 
  ${CacheCountryFields.code} $idType,
  ${CacheCountryFields.name} $textType,
  ${CacheCountryFields.region} $textType,
  ${CacheCountryFields.isFavourite} $boolType
  )
''');
  }

  Future<CacheCountry> insertCountry(CacheCountry country) async {
    final db = await instance.database;
    final id = await db.insert(tableName, country.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return country.copy(code: id.toString());
  }

  Future<List<CacheCountry>> getCountriesByFavourite() async {
    final db = await instance.database;
    final orderBy = '${CacheCountryFields.region} ASC';
    final result = await db.query(
      tableName,
      orderBy: orderBy,
      columns: CacheCountryFields.values,
      where: '${CacheCountryFields.isFavourite} = ?',
      whereArgs: [true],
    );
    if (result.isNotEmpty) {
      return result.map((json) => CacheCountry.fromJson(json)).toList();
    } else {
      throw Exception('no favourite object found');
    }
  }

  Future<List<CacheCountry>> getCountries() async {
    final db = await instance.database;
    final orderBy = '${CacheCountryFields.region} ASC';
    final result = await db.query(tableName, orderBy: orderBy);
    return result.map((json) => CacheCountry.fromJson(json)).toList();
  }

  Future<int> updateCountry(CacheCountry country) async {
    final db = await instance.database;
    return db.update(tableName, country.toJson(),
        where: '${CacheCountryFields.code} = ?',
        whereArgs: [country.code],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
