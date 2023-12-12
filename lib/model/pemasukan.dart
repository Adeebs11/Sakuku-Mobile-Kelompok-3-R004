class Pemasukan {
  int? id; // Variabel untuk menyimpan ID dari pemasukan
  String? kategori; // Variabel untuk menyimpan kategori pemasukan
  String? tanggal; // Variabel untuk menyimpan tanggal pemasukan
  String? jumlah; // Variabel untuk menyimpan jumlah pemasukan
  String? deskripsi; // Variabel untuk menyimpan deskripsi pemasukan

  Pemasukan(
      {this.id, this.kategori, this.tanggal, this.jumlah, this.deskripsi});
  // Konstruktor untuk membuat objek Pemasukan dengan parameter opsional

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id; // Jika ID tidak null, tambahkan ID ke dalam map
    }
    map['kategori'] = kategori; // Tambahkan kategori ke dalam map
    map['tanggal'] = tanggal; // Tambahkan tanggal ke dalam map
    map['jumlah'] = jumlah; // Tambahkan jumlah ke dalam map
    map['deskripsi'] = deskripsi; // Tambahkan deskripsi ke dalam map

    return map; // Kembalikan map sebagai representasi objek Pemasukan
  }

  Pemasukan.fromMap(Map<String, dynamic> map) {
    // Konstruktor alternatif untuk membuat objek Pemasukan dari map
    this.id = map['id']; // Isi ID dari map ke variabel ID
    this.kategori =
        map['kategori']; // Isi kategori dari map ke variabel kategori
    this.tanggal = map['tanggal']; // Isi tanggal dari map ke variabel tanggal
    this.jumlah = map['jumlah']; // Isi jumlah dari map ke variabel jumlah
    this.deskripsi =
        map['deskripsi']; // Isi deskripsi dari map ke variabel deskripsi
  }
}
