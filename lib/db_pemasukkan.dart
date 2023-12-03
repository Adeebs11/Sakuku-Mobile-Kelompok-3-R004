import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'pemasukkan.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableNama = 'tablePemasukkan';
  final String columnIds = 'id';
  final String columnKategori = 'kategori';
  final String columnTanggal = 'tanggal';
  final String columnJumlah = 'jumlah';
  final String columnDeskripsi = 'deskripsi';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get database  async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pemasukkan.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
     var sql = "CREATE TABLE $tableNama($columnIds INTEGER PRIMARY KEY, "
         "$columnKategori TEXT,"
         "$columnTanggal TEXT,"
         "$columnJumlah TEXT,"
         "$columnDeskripsi TEXT)";
     await db.execute(sql);
  }

  Future<int?> savePemasukkan(Pemasukkan pemasukkan) async {
    var dbClient = await _database;
    return await dbClient!.insert(tableNama, pemasukkan.toMap());
  }

  Future<List?> getAllPemasukkan() async {
    var dbClient = await _database;
    var result = await dbClient!.query(tableNama, columns: [
      columnIds,
      columnKategori,
      columnTanggal,
      columnJumlah,
      columnDeskripsi
    ]);

    return result.toList();
  }

  Future<int?> updatePemasukkan(Pemasukkan pemasukkan) async {
    var dbClient = await _database;
    return await dbClient!.update(tableNama, pemasukkan.toMap(), where: '$columnIds = ?', whereArgs: [pemasukkan.ids]);
  }

  Future<int?> deletePemasukkan(int id) async {
    var dbClient = await _database;
    return await dbClient!.delete(tableNama, where: '$columnIds = ?', whereArgs: [id]);
  }
}
