import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sakuku_mobile/model/pengeluaran.dart'; // Ganti dengan model yang sesuai

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'tablePengeluaranku';
  final String columnId = 'id';
  final String columnKategori = 'kategori';
  final String columnTanggal = 'tanggal';
  final String columnJumlah = 'jumlah';
  final String columnDeskripsi = 'deskripsi';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pengeluaranku.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnKategori TEXT,"
        "$columnTanggal TEXT,"
        "$columnJumlah TEXT,"
        "$columnDeskripsi TEXT)";
    await db.execute(sql);
  }

  Future<int?> savePengeluaran(Pengeluaran pengeluaran) async {
    try {
      var dbClient = await _db;
      if (dbClient != null) {
        return await dbClient.insert(tableName, pengeluaran.toMap());
      } else {
        print("Error: Database is null");
        return null; // Atau tangani kesalahan dengan cara yang sesuai
      }
    } catch (e) {
      print("Error saving Pengeluaran: $e");
      return null; // Atau tangani kesalahan dengan cara yang sesuai
    }
  }

  Future<int?> savePemasukan(Pengeluaran pengeluaran) async {
    try {
      var dbClient = await _db;
      if (dbClient != null) {
        return await dbClient.insert(tableName, pengeluaran.toMap());
      } else {
        print("Error: Database is null");
        return null; // Atau tangani kesalahan dengan cara yang sesuai
      }
    } catch (e) {
      print("Error saving Pemasukan: $e");
      return null; // Atau tangani kesalahan dengan cara yang sesuai
    }
  }

  Future<List?> getAllPengeluaran() async {
    var dbClient = await _db;
    if (dbClient == null) {
      return null;
    }

    var result = await dbClient.query(tableName, columns: [
      columnId,
      columnKategori,
      columnTanggal,
      columnJumlah,
      columnDeskripsi
    ]);

    return result.toList();
  }

  Future<List?> getAllPemasukan() async {
    var dbClient = await _db;
    if (dbClient == null) {
      return null;
    }

    var result = await dbClient.query(tableName, columns: [
      columnId,
      columnKategori,
      columnTanggal,
      columnJumlah,
      columnDeskripsi
    ]);

    return result.toList();
  }

  Future<int?> updatePengeluaran(Pengeluaran pengeluaran) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, pengeluaran.toMap(),
        where: '$columnId = ?', whereArgs: [pengeluaran.id]);
  }

  Future<int?> deletePengeluaran(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int?> updatePemasukan(Pengeluaran pengeluaran) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, pengeluaran.toMap(),
        where: '$columnId = ?', whereArgs: [pengeluaran.id]);
  }

  Future<int?> deletePemasukan(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}

