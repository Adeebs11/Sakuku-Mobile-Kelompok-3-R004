class Pengeluaran {
  int? id; // Variabel untuk menyimpan ID dari Pengeluaran
  String? kategori; // Variabel untuk menyimpan kategori Pengeluaran
  String? tanggal; // Variabel untuk menyimpan tanggal Pengeluaran
  String? jumlah; // Variabel untuk menyimpan jumlah Pengeluaran
  String? deskripsi; // Variabel untuk menyimpan deskripsi Pengeluaran

  Pengeluaran(
      {this.id, this.kategori, this.tanggal, this.jumlah, this.deskripsi});
  // Konstruktor untuk membuat objek Pengeluaran dengan parameter opsional

  Map<String, dynamic> toMap() {
    //toMap() Mengonversi objek Pengeluaran menjadi map (untuk penyimpanan database).
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id; // Jika ID tidak null, tambahkan ID ke dalam map
    }
    map['kategori'] = kategori; // Tambahkan kategori ke dalam map
    map['tanggal'] = tanggal; // Tambahkan tanggal ke dalam map
    map['jumlah'] = jumlah; // Tambahkan jumlah ke dalam map
    map['deskripsi'] = deskripsi; // Tambahkan deskripsi ke dalam map

    return map; // Kembalikan map sebagai representasi objek Pengeluaran
  }

  Pengeluaran.fromMap(Map<String, dynamic> map) {
    // Konstruktor alternatif untuk membuat objek Pengeluaran dari map
    this.id = map['id'];
    this.kategori = map['kategori'];
    this.tanggal = map['tanggal'];
    this.jumlah = map['jumlah'];
    this.deskripsi = map['deskripsi'];
  }

  bool isPengeluaran() {
    // Sesuaikan dengan kelompok kategori yang menunjukkan pengeluaran
    List<String> kategoriPengeluaran = [
      'Makanan & Minuman',
      'Transportasi',
      'Kebutuhan Rumah',
      'Perawatan Pribadi',
      'Belanja',
      'Kesehatan',
      'Pendidikan',
      'Lainnya'
    ];

    return kategoriPengeluaran.contains(kategori);
  }
}
