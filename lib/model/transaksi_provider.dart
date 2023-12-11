import 'package:flutter/foundation.dart';

class Transaksi {
  final String id;
  final String kategori;
  final double jumlah;

  Transaksi({required this.id, required this.kategori, required this.jumlah});
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

  void clearTransaksi() {
    _transaksi.clear();
    notifyListeners();
  }
}
