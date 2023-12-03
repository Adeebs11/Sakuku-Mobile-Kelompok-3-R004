import 'package:flutter/material.dart';
import 'package:sakuku_mobile/db_pemasukkan.dart';
import 'package:sakuku_mobile/pemasukkan.dart';
import 'package:sakuku_mobile/form_pemasukkan.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  List<Pemasukkan> listPemasukkan = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    _getAllPemasukkan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCE4FF),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.00, -1.00),
                  child: RichText(
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '                             Transaksi',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF8EA9FF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    width: 470,
                    height: 40,
                    child: Stack(
                      children: [
                        Align(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 400, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1),
                            child: Image.asset('assets/images/icontime.png'),
                            ),
                          ),
                        ),
                        Align(
                          child: Text(
                            'Rentang Waktu',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            itemCount: listPemasukkan.length,
            itemBuilder: (context, index) {
              Pemasukkan pemasukkan = listPemasukkan[index];
              return ListTile(
              onTap: () {
                //edit
              //  _openFormEdit(pemasukkan);
              },
              contentPadding: EdgeInsets.all(16),
              title: Text(
                '${pemasukkan.kategori} ${pemasukkan.tanggal}',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrangeAccent),
              ),
              subtitle: Text('${pemasukkan.jumlah}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  AlertDialog hapus = AlertDialog(
                    title: Text('Information'),
                    content: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                              'Apakah anda yakin ingin menghapus data ${pemasukkan.kategori} ${pemasukkan.tanggal} ${pemasukkan.jumlah} ${pemasukkan.ids} ${pemasukkan.deskripsi}'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Ya'),
                        onPressed: () {
                          //delete
                          //_deletePemasukkan(pemasukkan, index);
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
              //leading: IconButton(
              //  onPressed: () {
              //    //detail
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(pemasukkan)));
              //  },
              //  icon: Icon(Icons.visibility),
              //),
            );
            }
            ),
        ], 
      ),
    );
  }
  Future<void> _getAllPemasukkan() async {
    var list = await db.getAllPemasukkan();
    setState((){
      listPemasukkan.clear();
      list!.forEach((pemasukkan){
        listPemasukkan.add(Pemasukkan.fromMap(pemasukkan()));
      });
    });
  }

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
      context, MaterialPageRoute(builder: (context) => FormPemasukkan()));
      if (result == 'save') {
        await _getAllPemasukkan();
      }
  }

  Future<void> _openFormEdit(Pemasukkan pemasukkan) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormPemasukkan(pemasukkan: pemasukkan)));
    if (result == 'update') {
      await _getAllPemasukkan();
    }
  }

  Future<void> _deletePemasukkan(Pemasukkan pemasukkan, int position) async {
    await db.deletePemasukkan(pemasukkan.ids!);

    setState(() {
      listPemasukkan.removeAt(position);
    });
  }
}
