import 'package:flutter/foundation.dart';
//   Mengimpor pustaka foundation dari Flutter, dan lebih spesifik, kelas ChangeNotifier yang ada di dalamnya.
//     Kelas ini digunakan dalam manajemen state untuk memberi tahu widget ketika terjadi perubahan pada data.

// Kelas Transaksi merepresentasikan suatu transaksi dengan informasi seperti id, kategori, jumlah, dan tanggal.
class Transaksi {
  final String id;
  final String kategori;
  final double jumlah;
  final DateTime tanggal;

  Transaksi({
    required this.id,
    required this.kategori,
    required this.jumlah,
    required this.tanggal,
  });
}

// Kelas TransaksiProvider bertanggung jawab untuk menyimpan dan mengelola daftar transaksi.
class TransaksiProvider with ChangeNotifier {
  final List<Transaksi> _transaksi = [];

  // Metode untuk mendapatkan transaksi berdasarkan kategori.
  List<Transaksi> getTransaksi(String kategori) {
    List<Transaksi> filteredTransaksi =
        _transaksi.where((t) => t.kategori == kategori).toList();
    print('Transaksi for category $kategori: $filteredTransaksi');
    return filteredTransaksi;
  }

  // Metode untuk menambahkan transaksi ke daftar dan memberi tahu pendengar perubahan.
  void addTransaksi(Transaksi transaksi) {
    _transaksi.add(transaksi); // Perbarui total setelah menambah transaksi
    notifyListeners();
  }

  // Metode untuk menghapus transaksi dari daftar dan memberi tahu pendengar perubahan.
  void removeTransaksi(Transaksi transaksi) {
    _transaksi.remove(transaksi); // Perbarui total setelah menghapus transaksi
    notifyListeners();
  }

  // Metode untuk mendapatkan total nominal transaksi berdasarkan kategori.
  double getTotalNominal(String kategori) {
    return _transaksi
        .where((t) => t.kategori == kategori)
        .map((t) => t.jumlah)
        .fold(0, (prev, curr) => prev + curr);
  }

  // Metode untuk mendapatkan total pengeluaran.
  double getTotalPengeluaran() {
    return _transaksi
        .where((t) =>
            t.kategori != 'Gaji' &&
            t.kategori != 'Investasi' &&
            t.kategori != 'LainnyaPemasukan')
        .fold(0, (prev, curr) => prev + curr.jumlah);
  }

  // Metode untuk mendapatkan total pemasukan.
  double getTotalPemasukan() {
    return _transaksi
        .where((t) =>
            t.kategori == 'Gaji' ||
            t.kategori == 'Investasi' ||
            t.kategori == 'LainnyaPemasukan')
        .fold(0, (prev, curr) => prev + curr.jumlah);
  }

  // Metode untuk mendapatkan jumlah transaksi berdasarkan kategori.
  int getJumlahTransaksi(String kategori) {
    var transaksiByCategory =
        _transaksi.where((t) => t.kategori == kategori).toList();
    print(
        'Jumlah transaksi untuk kategori $kategori: ${transaksiByCategory.length}');
    return transaksiByCategory.length;
  }

  // Metode untuk mendapatkan transaksi pemasukan terakhir berdasarkan kategori.
  Transaksi? getLastIncomeByCategory(List<String> categories) {
    List<Transaksi> incomeList = _transaksi
        .where((transaksi) =>
            categories.contains(transaksi.kategori) && transaksi.jumlah > 0)
        .toList();

    if (incomeList.isEmpty) {
      return null;
    }

    incomeList.sort((a, b) => b.tanggal.compareTo(a.tanggal));
    return incomeList.first;
  }

  // Metode untuk mendapatkan transaksi pengeluaran terakhir berdasarkan kategori.
  Transaksi? getLastExpenseByCategory(List<String> categories) {
    List<Transaksi> incomeList = _transaksi
        .where((transaksi) =>
            categories.contains(transaksi.kategori) && transaksi.jumlah > 0)
        .toList();

    if (incomeList.isEmpty) {
      return null;
    }

    incomeList.sort((a, b) => b.tanggal.compareTo(a.tanggal));
    return incomeList.first;
  }

  // Metode untuk mendapatkan transaksi pemasukan terakhir berdasarkan kategori.
  Transaksi? getLastTransactionByCategory(String category) {
    List<Transaksi> filteredList = _transaksi
        .where((transaksi) => transaksi.kategori == category)
        .toList();

    if (filteredList.isNotEmpty) {
      filteredList.sort((a, b) => b.tanggal.compareTo(a.tanggal));
      return filteredList.first;
    }

    return null;
  }

  // Metode untuk mendapatkan transaksi pemasukan terbesar berdasarkan kategori.
  Transaksi? getLargestIncomeTransaction(String category) {
    List<Transaksi> incomeList = _transaksi
        .where((transaksi) =>
            transaksi.kategori == category &&
            transaksi.jumlah > 0) // Memastikan hanya pemasukan yang diambil
        .toList();

    if (incomeList.isNotEmpty) {
      incomeList.sort((a, b) => b.jumlah.compareTo(a.jumlah));
      return incomeList.first;
    }
    return null;
  }

  // Metode untuk mendapatkan transaksi pemasukan terkecil berdasarkan kategori.
  Transaksi? getSmallestIncomeTransaction(String kategori) {
    List<Transaksi> incomeTransactions =
        _transaksi.where((t) => t.kategori == kategori).toList();

    if (incomeTransactions.isEmpty) {
      return null;
    }

    incomeTransactions.sort((a, b) => a.jumlah.compareTo(b.jumlah));
    return incomeTransactions.first;
  }

  // Metode untuk mendapatkan transaksi pengeluaran terbesar berdasarkan kategori.
  Transaksi? getLargestExpenseTransaction(String category) {
    List<Transaksi> expenseTransactions = _transaksi
        .where((transaksi) =>
            transaksi.kategori == category &&
            transaksi.jumlah > 0) // Memastikan hanya pengeluaran yang diambil
        .toList();

    if (expenseTransactions.isEmpty) {
      return null;
    }

    expenseTransactions.sort((a, b) => b.jumlah.compareTo(a.jumlah));
    return expenseTransactions.first;
  }

  // Metode untuk mendapatkan transaksi pengeluaran terkecil berdasarkan kategori.
  Transaksi? getSmallestExpenseTransaction(String kategori) {
    List<Transaksi> expenseTransactions = _transaksi
        .where((transaksi) =>
            transaksi.kategori == kategori && transaksi.jumlah > 0)
        .toList();

    print(
        'Jumlah transaksi pengeluaran untuk kategori $kategori: ${expenseTransactions.length}');

    if (expenseTransactions.isEmpty) {
      return null;
    }

    expenseTransactions.sort((a, b) => a.jumlah.compareTo(b.jumlah));

    print(
        'Transaksi setelah pengurutan: ${expenseTransactions.map((t) => t.jumlah)}');

    return expenseTransactions.first;
  }

// Metode untuk membersihkan daftar transaksi.
  void clearTransaksi() {
    _transaksi.clear();
    notifyListeners();
  }
}
