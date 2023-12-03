import 'package:flutter/material.dart';
import 'package:sakuku_mobile/db_pemasukkan.dart';
import 'package:sakuku_mobile/pemasukkan.dart';

class FormPemasukkan extends StatefulWidget {
  final Pemasukkan? pemasukkan;

  FormPemasukkan({this.pemasukkan});

  @override
  _FormPemasukkanState createState() => _FormPemasukkanState();
}



class _FormPemasukkanState extends State<FormPemasukkan> {
  DbHelper db = DbHelper();

  TextEditingController? kategori;
  TextEditingController? tanggal;
  TextEditingController? jumlah;
  TextEditingController? deskripsi;

  

  @override
  void initState() {
    kategori = TextEditingController(
        text: widget.pemasukkan == null ? '' : widget.pemasukkan!.kategori);
    tanggal = TextEditingController(
        text: widget.pemasukkan == null ? '' : widget.pemasukkan!.tanggal);
    jumlah = TextEditingController(
        text: widget.pemasukkan == null ? '' : widget.pemasukkan!.jumlah);
    deskripsi = TextEditingController(
        text: widget.pemasukkan == null ? '' : widget.pemasukkan!.deskripsi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(primary: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pemasukkan'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: kategori,
            decoration: InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: tanggal,
            decoration: InputDecoration(
                labelText: 'Tanggal',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: jumlah,
            decoration: InputDecoration(
                labelText: 'Jumlah',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: deskripsi,
            decoration: InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          ElevatedButton(
            child: (widget.pemasukkan == null)
                ? Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )
                : Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
            style: style,
            onPressed: () {
              upsertPemasukkan();
            },
          )
        ],
      ),
    );
  }

  Future<void> upsertPemasukkan() async {
    if (widget.pemasukkan != null) {
      //insert

      await db.updatePemasukkan(Pemasukkan.fromMap({
        'id' : widget.pemasukkan!.ids,
        'kategori' : kategori!.text,
        'tanggal' : tanggal!.text,
        'jumlah' : jumlah!.text,
        'deskripsi' : deskripsi!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //update
      await db.savePemasukkan(Pemasukkan(
        kategori: kategori!.text,
        tanggal: tanggal!.text,
        jumlah: jumlah!.text,
        deskripsi: deskripsi!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
