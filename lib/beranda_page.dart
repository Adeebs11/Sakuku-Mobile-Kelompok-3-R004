import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCE4FF),
      body: // Generated code for this Column Widget...
          Column(
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
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
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
                                  'assets/images/pemasukan.png', // Ganti dengan path gambar Anda
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
                                        'Rp. 10.050.000',
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
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        '5',
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
                                    alignment: AlignmentDirectional(0.00, 1.00),
                                    child: Text(
                                      '05/05/2023',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 9,
                                      ),
                                    ),
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
                                  'assets/images/pengeluaran.png', // Ganti dengan path gambar Anda
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
                                        'Rp. 10.050.000',
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
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        '5',
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
                                    alignment: AlignmentDirectional(0.00, 1.00),
                                    child: Text(
                                      '05/05/2023',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 9,
                                      ),
                                    ),
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
              ),
            ],
          ),
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
                            SizedBox(
                                height:
                                    5), // Ganti dengan jarak yang diinginkan
                            Text(
                              'Rp 1.000.000',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 20), // spasi antara teks
                            Text(
                              'Pemasukan Terendah',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Arial',
                                fontSize: 9,
                              ),
                            ),
                            SizedBox(
                                height:
                                    5), // Ganti dengan jarak yang diinginkan
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
                            SizedBox(
                                height:
                                    5), // Ganti dengan jarak yang diinginkan
                            Text(
                              'Rp 1.000.000',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 20), // spasi antara teks
                            Text(
                              'Pengeluaran Terendah',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Arial',
                                fontSize: 9,
                              ),
                            ),
                            SizedBox(
                                height:
                                    5), // Ganti dengan jarak yang diinginkan
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
