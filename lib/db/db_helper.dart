import 'package:sakuku_mobile/model/pengeluaran.dart';
import 'package:path/path.dart'; // Library untuk manipulasi path file
import 'package:sqflite/sqflite.dart'; // Library untuk bekerja dengan SQLite

class DbHelper {
  static final DbHelper _instance = DbHelper._internal(); // Instance singleton
  static Database? _database; // Database instance

  final String tableName = 'tableSakuKu'; // Nama tabel dalam database
  final String columnId = 'id'; // Nama kolom ID dalam tabel
  final String columnKategori = 'kategori'; // Nama kolom kategori dalam tabel
  final String columnTanggal = 'tanggal'; // Nama kolom tanggal dalam tabel
  final String columnJumlah = 'jumlah'; // Nama kolom jumlah dalam tabel
  final String columnDeskripsi =
      'deskripsi'; // Nama kolom deskripsi dalam tabel

  DbHelper._internal(); // Konstruktor internal untuk singleton
  factory DbHelper() => _instance; // Factory method untuk mendapatkan instance

  Future<Database?> get _db async {
    if (_database != null) {
      return _database; // Jika database sudah dibuat, gunakan yang sudah ada
    }
    _database = await _initDb(); // Jika belum, buat database baru
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasesPath =
        await getDatabasesPath(); // Mendapatkan path databases
    String path = join(databasesPath, 'sakuku.db'); // Menyusun path database

    return await openDatabase(path,
        version: 1,
        onCreate:
            _onCreate); // Membuka database atau membuat baru jika belum ada
  }

  // Membuat tabel saat pertama kali aplikasi dijalankan
  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnKategori TEXT,"
        "$columnTanggal TEXT,"
        "$columnJumlah TEXT,"
        "$columnDeskripsi TEXT)";
    await db.execute(sql);
  }

  // Menyimpan data pengeluaran ke dalam database
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

  // Menyimpan data pemasukan ke dalam database
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

  // Mendapatkan semua data pengeluaran dari database
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

  // Mendapatkan semua data pemasukan dari database
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

  // Mengupdate data pengeluaran dalam database
  Future<int?> updatePengeluaran(Pengeluaran pengeluaran) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, pengeluaran.toMap(),
        where: '$columnId = ?', whereArgs: [pengeluaran.id]);
  }

  // Menghapus data pengeluaran dari database
  Future<int?> deletePengeluaran(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  // Mengupdate data pemasukan dalam database
  Future<int?> updatePemasukan(Pengeluaran pengeluaran) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, pengeluaran.toMap(),
        where: '$columnId = ?', whereArgs: [pengeluaran.id]);
  }

  // Menghapus data pemasukan dari database
  Future<int?> deletePemasukan(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
