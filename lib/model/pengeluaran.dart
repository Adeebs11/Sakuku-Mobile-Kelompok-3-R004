class Pengeluaran {
  int? id;
  String? kategori;
  String? tanggal;
  String? jumlah;
  String? deskripsi;

  Pengeluaran(
      {this.id, this.kategori, this.tanggal, this.jumlah, this.deskripsi});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['kategori'] = kategori;
    map['tanggal'] = tanggal;
    map['jumlah'] = jumlah;
    map['deskripsi'] = deskripsi;
    return map;
  }

  Pengeluaran.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.kategori = map['kategori'];
    this.tanggal = map['tanggal'];
    this.jumlah = map['jumlah'];
    this.deskripsi = map['deskripsi'];
  }
}
