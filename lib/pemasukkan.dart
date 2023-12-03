class Pemasukkan {
  int? ids;
  String? kategori;
  String? tanggal;
  String? jumlah;
  String? deskripsi;

  Pemasukkan({this.ids, this.kategori, this.tanggal, this.jumlah, this.deskripsi});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (ids != null) {
      map['id'] = ids;
    }
    map['kategori'] = kategori;
    map['tanggal'] = tanggal;
    map['jumlah'] = jumlah;
    map['deskripsi'] = deskripsi;
    return map;
  }

  Pemasukkan.fromMap(Map<String, dynamic> map) {
    this.ids = map['id'];
    this.kategori = map['kategori'];
    this.tanggal = map['tanggal'];
    this.jumlah = map['jumlah'];
    this.deskripsi = map['deskripsi'];
  }
}

