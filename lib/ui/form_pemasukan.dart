import 'package:flutter/material.dart';
import 'package:sakuku_mobile/db/db_helper.dart';
import 'package:sakuku_mobile/model/pengeluaran.dart';
import 'package:intl/intl.dart';
import 'package:sakuku_mobile/model/transaksi_provider.dart';
import 'package:provider/provider.dart';

class FormPemasukan extends StatefulWidget {
  final Pengeluaran? pengeluaran;

  const FormPemasukan({this.pengeluaran});

  @override
  _FormPemasukanState createState() => _FormPemasukanState();
}

class _FormPemasukanState extends State<FormPemasukan> {
  DbHelper db = DbHelper();

  List<String> list = ['Gaji', 'Investasi', 'LainnyaPemasukan'];
  late String dropDownValue = list.first;

  TextEditingController? kategori;
  TextEditingController? tanggal;
  TextEditingController? jumlah;
  TextEditingController? deskripsi;

  String? selectedValue;

  @override
  void initState() {
    kategori = TextEditingController(
        text: widget.pengeluaran == null ? '' : widget.pengeluaran!.kategori);
    tanggal = TextEditingController(
        text: widget.pengeluaran == null ? '' : widget.pengeluaran!.tanggal);
    jumlah = TextEditingController(
      text: widget.pengeluaran == null
          ? ''
          : widget.pengeluaran!.jumlah.toString(),
    );
    deskripsi = TextEditingController(
        text: widget.pengeluaran == null ? '' : widget.pengeluaran!.deskripsi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: Color(0xFF4F5E8D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
    return Scaffold(
      backgroundColor: Color(0xFFD1DCFF),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Tambah Pemasukan',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFD1DCFF),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 500,
          height: 400,
          margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color(0xFFBBCBFF),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Kategori',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: selectedValue,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  icon: Icon(Icons.expand_more),
                  iconEnabledColor: Colors.black,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                color:
                    Colors.white, // Ganti warna latar belakang sesuai kebutuhan
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: tanggal,
                  decoration: InputDecoration(
                    labelText: 'Tanggal',
                    labelStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    filled: true, // Set true agar latar belakang diisi
                    fillColor: Colors
                        .white, // Ganti warna latar belakang sesuai kebutuhan
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      color: Colors.black,
                      onPressed: () async {
                        DateTime selectedDate = DateTime.now();
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );

                        if (picked != null && picked != selectedDate) {
                          setState(() {
                            selectedDate = picked;
                            tanggal?.text =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                color:
                    Colors.white, // Ganti warna latar belakang sesuai kebutuhan
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: jumlah,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah',
                    labelStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    filled: true, // Set true agar latar belakang diisi
                    fillColor: Colors
                        .white, // Ganti warna latar belakang sesuai kebutuhan
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                color:
                    Colors.white, // Ganti warna latar belakang sesuai kebutuhan
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: deskripsi,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi',
                    labelStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    filled: true, // Set true agar latar belakang diisi
                    fillColor: Colors
                        .white, // Ganti warna latar belakang sesuai kebutuhan
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              ElevatedButton(
                child: (widget.pengeluaran == null)
                    ? Text(
                        'SIMPAN',
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                style: style,
                onPressed: () {
                  upsertPemasukan();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> upsertPemasukan() async {
    TransaksiProvider transaksiProvider =
        Provider.of<TransaksiProvider>(context, listen: false);

    if (widget.pengeluaran != null) {
      // Update
      await db.updatePemasukan(Pengeluaran.fromMap({
        'id': widget.pengeluaran!.id,
        'kategori': selectedValue,
        'tanggal': tanggal?.text ?? '',
        'jumlah': double.parse(jumlah?.text ?? '0').toString(),
        'deskripsi': deskripsi?.text ?? '',
      }));

      // Update TransaksiProvider
      if (selectedValue != null) {
        transaksiProvider.addTransaksi(
          Transaksi(
            kategori: selectedValue!,
            jumlah: double.parse(jumlah?.text ?? '0'),
            id: '',
          ),
        );
      }

      Navigator.pop(context, 'update');
    } else {
      // Insert
      await db.savePemasukan(Pengeluaran(
        kategori: selectedValue,
        tanggal: tanggal?.text ?? '',
        jumlah: double.parse(jumlah?.text ?? '0').toString(),
        deskripsi: deskripsi?.text ?? '',
      ));

      // Add new Transaksi to TransaksiProvider
      if (selectedValue != null && jumlah?.text != null) {
        transaksiProvider.addTransaksi(
          Transaksi(
            kategori: selectedValue!,
            jumlah: double.parse(jumlah!.text),
            id: '',
          ),
        );
      }

      Navigator.pop(context, 'save');
    }
  }
}

