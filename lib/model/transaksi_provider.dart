import 'package:flutter/foundation.dart';

class Transaksi {
  final String id;
  final String kategori;
  final double jumlah;
  final DateTime tanggal;

  Transaksi({required this.id, required this.kategori, required this.jumlah, required this.tanggal});
}

class TransaksiProvider with ChangeNotifier {
  final List<Transaksi> _transaksi = [];

  List<Transaksi> getTransaksi(String kategori) {
    List<Transaksi> filteredTransaksi =
        _transaksi.where((t) => t.kategori == kategori).toList();
    print('Transaksi for category $kategori: $filteredTransaksi');
    return filteredTransaksi;
  }

  void addTransaksi(Transaksi transaksi) {
    _transaksi.add(transaksi); // Perbarui total setelah menambah transaksi
    
    notifyListeners();
  }

  void removeTransaksi(Transaksi transaksi) {
    _transaksi.remove(transaksi); // Perbarui total setelah menghapus transaksi
    notifyListeners();
  }

  double getTotalNominal(String kategori) {
    return _transaksi
        .where((t) => t.kategori == kategori)
        .map((t) => t.jumlah)
        .fold(0, (prev, curr) => prev + curr);
  }

  double getTotalPengeluaran() {
    return _transaksi
        .where((t) =>
            t.kategori != 'Gaji' &&
            t.kategori != 'Investasi' &&
            t.kategori != 'LainnyaPemasukan')
        .fold(0, (prev, curr) => prev + curr.jumlah);
  }

  double getTotalPemasukan() {
    return _transaksi
        .where((t) =>
            t.kategori == 'Gaji' ||
            t.kategori == 'Investasi' ||
            t.kategori == 'LainnyaPemasukan')
        .fold(0, (prev, curr) => prev + curr.jumlah);
  }

  int getJumlahTransaksi(String kategori) {
    var transaksiByCategory =
        _transaksi.where((t) => t.kategori == kategori).toList();
    print(
        'Jumlah transaksi untuk kategori $kategori: ${transaksiByCategory.length}');
    return transaksiByCategory.length;
  }

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

 Transaksi? getLastTransactionByCategory(String category) {
  List<Transaksi> filteredList =
      _transaksi.where((transaksi) => transaksi.kategori == category).toList();
  
  if (filteredList.isNotEmpty) {
    filteredList.sort((a, b) => b.tanggal.compareTo(a.tanggal));
    return filteredList.first;
  }

  return null;
}



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

  Transaksi? getSmallestIncomeTransaction(String kategori) {
  List<Transaksi> incomeTransactions =
      _transaksi.where((t) => t.kategori == kategori).toList();

  if (incomeTransactions.isEmpty) {
    return null;
  }

  incomeTransactions.sort((a, b) => a.jumlah.compareTo(b.jumlah));
  return incomeTransactions.first;
}

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

  Transaksi? getSmallestExpenseTransaction(String kategori) {
  List<Transaksi> expenseTransactions = _transaksi
      .where((transaksi) =>
          transaksi.kategori == kategori && transaksi.jumlah > 0)
      .toList();

  print('Jumlah transaksi pengeluaran untuk kategori $kategori: ${expenseTransactions.length}');

  if (expenseTransactions.isEmpty) {
    return null;
  }

  expenseTransactions.sort((a, b) => a.jumlah.compareTo(b.jumlah));

  print('Transaksi setelah pengurutan: ${expenseTransactions.map((t) => t.jumlah)}');

  return expenseTransactions.first;
}

  void clearTransaksi() {
    _transaksi.clear();
    notifyListeners();
  }
}
