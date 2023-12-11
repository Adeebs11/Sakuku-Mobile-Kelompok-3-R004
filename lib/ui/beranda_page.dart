import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakuku_mobile/model/transaksi_provider.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCE4FF),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/SakuKuLogo.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        alignment: Alignment(0.00, 0.00),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Text(
                'Hai,',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arial',
                  color: Color(0xFF4F5E8D),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Text(
            'Pengguna',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Arial',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Consumer<TransaksiProvider>(
            builder: (context, transaksiProvider, _) {
              double totalPemasukan = transaksiProvider.getTotalPemasukan();
              double totalPengeluaran = transaksiProvider.getTotalPengeluaran();

              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                        child: Container(
                          width: 180,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x43000000),
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 25,
                                right: 10,
                                child: Image.asset(
                                  'assets/images/pemasukan.png',
                                  width: 35.0,
                                  height: 35.0,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 4, 0, 0),
                                      child: Text(
                                        'Total Pemasukan',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Rp. ${totalPemasukan.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        'Transaksi',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Consumer<TransaksiProvider>(
                                    builder: (context, transaksiProvider, _) {
                                      int jumlahTransaksi = transaksiProvider
                                              .getJumlahTransaksi('Gaji') +
                                          transaksiProvider
                                              .getJumlahTransaksi('Investasi') +
                                          transaksiProvider.getJumlahTransaksi(
                                              'LainnyaPemasukan'); // Ganti dengan kategori yang sesuai
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            '$jumlahTransaksi',
                                            style: TextStyle(
                                              fontFamily: 'Arial',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 10, 0),
                        child: Container(
                          width: 180,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x43000000),
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 25,
                                right: 10,
                                child: Image.asset(
                                  'assets/images/pengeluaran.png',
                                  width: 35.0,
                                  height: 35.0,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 4, 0, 0),
                                      child: Text(
                                        'Total Pengeluaran',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Rp. ${totalPengeluaran.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        'Transaksi',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Consumer<TransaksiProvider>(
                                    builder: (context, transaksiProvider, _) {
                                      int jumlahTransaksi2 = transaksiProvider
                                              .getJumlahTransaksi(
                                                  'Makanan & Minuman') +
                                          transaksiProvider.getJumlahTransaksi(
                                              'Transportasi') +
                                          transaksiProvider.getJumlahTransaksi(
                                              'Kebutuhan Rumah') +
                                          transaksiProvider.getJumlahTransaksi(
                                              'Perawatan Pribadi') +
                                          transaksiProvider
                                              .getJumlahTransaksi('Belanja') +
                                          transaksiProvider
                                              .getJumlahTransaksi('Kesehatan') +
                                          transaksiProvider.getJumlahTransaksi(
                                              'Pendidikan') +
                                          transaksiProvider.getJumlahTransaksi(
                                              'Lainnya'); // Ganti dengan kategori yang sesuai
                                      // Ganti dengan kategori yang sesuai
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            '$jumlahTransaksi2',
                                            style: TextStyle(
                                              fontFamily: 'Arial',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Align(),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Container(
                  width: 360,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x41000000),
                        offset: Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, -1.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                              child: Text(
                                'Detail Pemasukan',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                              child: Text(
                                'Pemasukan Terakhir',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                              child: Text(
                                'Rp 1.000.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  color: Color(0xFF72A884),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 35,
                        top: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pemasukan Tertinggi',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Arial',
                                fontSize: 9,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Rp 1.000.000',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Pemasukan Terendah',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Arial',
                                fontSize: 9,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Rp 1.500.000',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: 360,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x41000000),
                        offset: Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, -1.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                              child: Text(
                                'Detail Pemasukan',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                              child: Text(
                                'Pengeluaran Terakhir',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                              child: Text(
                                'Rp 2.000.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  color: Color(0xFFF5CE85),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 35,
                        top: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pengeluaran Tertinggi',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Arial',
                                fontSize: 9,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Rp 1.000.000',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Pengeluaran Terendah',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Arial',
                                fontSize: 9,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Rp 1.500.000',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
