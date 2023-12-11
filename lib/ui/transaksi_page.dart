import 'package:flutter/material.dart';
import 'package:sakuku_mobile/model/pengeluaran.dart'; // Ganti dengan model yang sesuai
import 'package:sakuku_mobile/ui/form_pengeluaran.dart';
import 'package:sakuku_mobile/ui/form_pemasukan.dart';
import 'package:sakuku_mobile/db/db_helper.dart';
import 'package:provider/provider.dart';
import 'package:sakuku_mobile/model/transaksi_provider.dart';

class TransaksisPage extends StatefulWidget {
  const TransaksisPage({Key? key}) : super(key: key);

  @override
  _TransaksisPageState createState() => _TransaksisPageState();
}

class _TransaksisPageState extends State<TransaksisPage> {
  List<Pengeluaran> listPengeluaran = [];
  List<Pengeluaran> listPemasukan = [];
  //List<Pengeluaran> listPemasukan = [];

  DbHelper db = DbHelper();
  //final Color warna;

  @override
  void initState() {
    _getAllPengeluaran();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //bool isConditionTrue = false;
    //Color textColor = isConditionTrue ? Colors.redAccent : Colors.green;
    var transaksiProvider = Provider.of<TransaksiProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFFDCE4FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Transaksi',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFDCE4FF),
      ),
      body: ListView.builder(
        itemCount: listPengeluaran.length,
        itemBuilder: (context, index) {
          Pengeluaran pengeluaran = listPengeluaran[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  15.0), // Memberikan border radius untuk membuat card lebih bulat
            ),
            margin: EdgeInsets.fromLTRB(10, 7, 10, 5),
            child: ListTile(
              onTap: () {
                //edit
                _openFormEdit(pengeluaran);
              },
              contentPadding: EdgeInsets.fromLTRB(20, 15, 7, 5),
              tileColor: Colors.white,
              title: Text(
                '${pengeluaran.kategori} | ${pengeluaran.tanggal}',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Arial',
                  //fontStyle: FontStyle.italic,
                  color: Colors.black,
                  //color: Colors.redAccent
                ),
              ),
              subtitle: Text(
                '${pengeluaran.deskripsi} | Rp. ${pengeluaran.jumlah}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                onPressed: () {
                  AlertDialog hapus = AlertDialog(
                    title: Text('Information'),
                    content: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                              'Apakah anda yakin ingin menghapus data ${pengeluaran.kategori} ${pengeluaran.id} ${pengeluaran.deskripsi}'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Ya'),
                        onPressed: () async {
                          //delete
                          await _deletePengeluaran(
                              pengeluaran, index, transaksiProvider);
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text('Tidak'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                  showDialog(context: context, builder: (context) => hapus);
                },
              ),
            ),
          );
          // Pengeluaran pengeluaran = listPengeluaran[index];
          // return ListTile(

          //   onTap: () {
          //     //edit
          //     _openFormEdit(pengeluaran);
          //   },
          //   contentPadding: EdgeInsets.all(16),

          //   title: Text(
          //     '${pengeluaran.kategori} | ${pengeluaran.tanggal}',
          //     style: TextStyle(
          //         fontSize: 18,
          //         fontStyle: FontStyle.italic,
          //         color: Colors.black,
          //         //color: Colors.redAccent
          //         ),
          //   ),
          //   subtitle: Text(
          //     '${pengeluaran.deskripsi} | Rp. ${pengeluaran.jumlah}',
          //     style: TextStyle(fontSize: 14,
          //      color: Colors.grey
          //     ),
          //   ),
          //   trailing: IconButton(
          //     icon: Icon(Icons.delete),
          //     onPressed: () {
          //       AlertDialog hapus = AlertDialog(
          //         title: Text('Information'),
          //         content: Container(
          //           height: 100,
          //           child: Column(
          //             children: [
          //               Text(
          //                   'Apakah anda yakin ingin menghapus data ${pengeluaran.kategori} ${pengeluaran.id} ${pengeluaran.deskripsi}'),
          //             ],
          //           ),
          //         ),
          //         actions: [
          //           TextButton(
          //             child: Text('Ya'),
          //             onPressed: () async {
          //               //delete
          //               await _deletePengeluaran(
          //                   pengeluaran, index, transaksiProvider);
          //               Navigator.pop(context);
          //             },
          //           ),
          //           TextButton(
          //             child: Text('Tidak'),
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //           ),
          //         ],
          //       );
          //       showDialog(context: context, builder: (context) => hapus);
          //     },
          //   ),
          // );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Geser ikon ke kanan
        children: [
          FloatingActionButton(
            heroTag: "pengeluaran1",
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
            onPressed: () {
              // Tambahkan logika pengurangan di sini
              _openFormPengeluaran();
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: "pemasukan1",
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(255, 76, 175, 92),
            onPressed: () {
              // Tambahkan logika penambahan di sini
              _openFormPemasukan();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _getAllPengeluaran() async {
    var list = await db.getAllPengeluaran();

    if (list != null) {
      var transaksiProvider =
          Provider.of<TransaksiProvider>(context, listen: false);
      transaksiProvider.clearTransaksi();
      setState(() {
        listPengeluaran.clear();
        list.forEach((pengeluaran) {
          listPengeluaran.add(Pengeluaran.fromMap(pengeluaran));

          transaksiProvider.addTransaksi(
            Transaksi(
              kategori: pengeluaran['kategori'] ?? 'Default Kategori',
              jumlah: double.parse(pengeluaran['jumlah'] ?? '0'),
              id: '',
            ),
          );
        });
      });

      // Pastikan untuk memanggil notifyListeners() di sini.
      transaksiProvider.notifyListeners();
    }
  }

  Future<void> _openFormPengeluaran() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormPengeluaran()));
    if (result == 'save') {
      await _getAllPengeluaran();
    }
  }

  Future<void> _getAllPemasukan() async {
    var list = await db.getAllPemasukan();

    if (list != null) {
      var transaksiProvider =
          Provider.of<TransaksiProvider>(context, listen: false);
      transaksiProvider.clearTransaksi();
      setState(() {
        listPengeluaran.clear();
        list.forEach((pengeluaran) {
          listPengeluaran.add(Pengeluaran.fromMap(pengeluaran));

          transaksiProvider.addTransaksi(
            Transaksi(
              kategori: pengeluaran['kategori'] ?? 'Default Kategori',
              jumlah: double.parse(pengeluaran['jumlah'] ?? '0'),
              id: '',
            ),
          );
        });
      });

      // Pastikan untuk memanggil notifyListeners() di sini.
      transaksiProvider.notifyListeners();
    }
  }

  Future<void> _openFormPemasukan() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormPemasukan()));
    if (result == 'save') {
      await _getAllPengeluaran();
    }
  }

  Future<void> _openFormEdit(Pengeluaran pengeluaran) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FormPengeluaran(pengeluaran: pengeluaran)));
    if (result == 'update') {
      await _getAllPengeluaran();
    }
  }

  Future<void> _deletePengeluaran(Pengeluaran pengeluaran, int position,
      TransaksiProvider transaksiProvider) async {
    await db.deletePengeluaran(pengeluaran.id!);

    // Hapus transaksi yang sesuai dengan kategori dan id pengeluaran yang dihapus
    transaksiProvider.removeTransaksi(
      Transaksi(
        kategori: pengeluaran.kategori!,
        jumlah: double.parse(pengeluaran.jumlah.toString()),
        id: '',
      ),
    );

    setState(() {
      listPengeluaran.removeAt(position);
    });
  }
}
