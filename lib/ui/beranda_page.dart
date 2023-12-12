import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakukumobile/model/transaksi_provider.dart';

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
                                              'Lainnyaa'); // Ganti dengan kategori yang sesuai
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
                              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                              child: Consumer<TransaksiProvider>(
                                builder: (context, transaksiProvider, _) {
                                  // Mendapatkan transaksi pemasukan terakhir untuk kategori tertentu
                                  Transaksi? lastIncomeTransaction = transaksiProvider.getLastIncomeByCategory(['Gaji', 'Investasi', 'Lainnyaa']);

                                  // Menentukan kategori transaksi pemasukan terakhir yang akan ditampilkan
                                  String displayedCategory = lastIncomeTransaction?.kategori ?? '';

                                  // Mengambil nominal dari transaksi pemasukan terakhir
                                  double totalNominalPemasukan = lastIncomeTransaction?.jumlah ?? 0;

                                  return Text(
                                    'Rp ${totalNominalPemasukan.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      color: Color(0xFF72A884),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  );
                                },
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
                            Consumer<TransaksiProvider>(
                              builder: (context, transaksiProvider, _) {
                                final largestGajiTransaction =
                                    transaksiProvider.getLargestIncomeTransaction('Gaji');
                                final largestInvestasiTransaction =
                                    transaksiProvider.getLargestIncomeTransaction('Investasi');
                                final largestLainnyaTransaction =
                                    transaksiProvider.getLargestIncomeTransaction('Lainnyaa');

                                double largestAmount = largestGajiTransaction?.jumlah ?? 0;
                                String largestCategory = 'Gaji';

                                if (largestInvestasiTransaction != null && largestInvestasiTransaction.jumlah! > largestAmount) {
                                  largestAmount = largestInvestasiTransaction.jumlah!;
                                  largestCategory = 'Investasi';
                                }

                                if (largestLainnyaTransaction != null && largestLainnyaTransaction.jumlah! > largestAmount) {
                                  largestAmount = largestLainnyaTransaction.jumlah!;
                                  largestCategory = 'Lainnyaa';
                                }

                                return Text(
                                  'Rp ${largestAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                );
                              },
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
                            Consumer<TransaksiProvider>(
                              builder: (context, transaksiProvider, _) {
                                final smallestGajiTransaction =
                                    transaksiProvider.getSmallestIncomeTransaction('Gaji');
                                final smallestInvestasiTransaction =
                                    transaksiProvider.getSmallestIncomeTransaction('Investasi');
                                final smallestLainnyaTransaction =
                                    transaksiProvider.getSmallestIncomeTransaction('Lainnyaa');

                                double smallestAmount = smallestGajiTransaction?.jumlah ?? 0;
                                String smallestCategory = 'Gaji';

                                if (smallestInvestasiTransaction != null && smallestInvestasiTransaction.jumlah! < smallestAmount) {
                                  smallestAmount = smallestInvestasiTransaction.jumlah!;
                                  smallestCategory = 'Investasi';
                                }

                                if (smallestLainnyaTransaction != null && smallestLainnyaTransaction.jumlah! < smallestAmount) {
                                  smallestAmount = smallestLainnyaTransaction.jumlah!;
                                  smallestCategory = 'Lainnyaa';
                                }

                                return Text(
                                  'Rp ${smallestAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                );
                              },
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
                                'Detail Pengeluaran',
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
                              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
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
                              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                              child: Consumer<TransaksiProvider>(
                                builder: (context, transaksiProvider, _) {
                                  // Mendapatkan transaksi pemasukan terakhir untuk kategori tertentu
                                  Transaksi? lastExpenseTransaction = transaksiProvider.getLastExpenseByCategory(['Makanan & Minuman', 'Transportasi', 'Kebutuhan Rumah' ,'Perawatan Pribadi', 'Belanja', 'Kesehatan', 'Pendidikan', 'Lainnya']);

                                  // Menentukan kategori transaksi pemasukan terakhir yang akan ditampilkan
                                  String displayedCategory = lastExpenseTransaction?.kategori ?? '';

                                  // Mengambil nominal dari transaksi pemasukan terakhir
                                  double totalNominalPengeluaran = lastExpenseTransaction?.jumlah ?? 0;

                                  return Text(
                                    'Rp ${totalNominalPengeluaran.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      color: Color(0xFFF5CE85),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  );
                                },
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
                            Consumer<TransaksiProvider>(
                              builder: (context, transaksiProvider, _) {
                                final largestMakananTransaction =
                                    transaksiProvider.getLargestExpenseTransaction('Makanan & Minuman');
                                final largestTransportasiTransaction =
                                    transaksiProvider.getLargestExpenseTransaction('Transportasi');
                                final largestKebutuhanRumahTransaction =
                                    transaksiProvider.getLargestExpenseTransaction('Kebutuhan Rumah');
                                final largestPerawatanPribadiTransaction =
                                    transaksiProvider.getLargestExpenseTransaction('Perawatan Pribadi');
                                    final largestBelanjaTransaction =
                                    transaksiProvider.getLargestExpenseTransaction('Belanja');
                                    final largestKesehatanTransaction =
                                    transaksiProvider.getLargestExpenseTransaction('Kesehatan');
                                    final largestPendidikanTransaction =
                                    transaksiProvider.getLargestExpenseTransaction('Pendidikan');
                                    final largestLainnyaTransaction =
                                    transaksiProvider.getLargestExpenseTransaction('Lainnya');              
                                // ... tambahkan baris serupa untuk kategori lainnya

                                double largestExpenseAmount = largestMakananTransaction?.jumlah ?? 0;
                                String largestExpenseCategory = 'Makanan & Minuman';

                                if (largestTransportasiTransaction != null && largestTransportasiTransaction.jumlah > largestExpenseAmount) {
                                    largestExpenseAmount = largestTransportasiTransaction.jumlah;
                                    largestExpenseCategory = 'Transportasi';
                                }

                                if (largestKebutuhanRumahTransaction != null && largestKebutuhanRumahTransaction.jumlah > largestExpenseAmount) {
                                  largestExpenseAmount = largestKebutuhanRumahTransaction.jumlah;
                                  largestExpenseCategory = 'Kebutuhan Rumah';
                                }

                                if (largestPerawatanPribadiTransaction != null && largestPerawatanPribadiTransaction.jumlah > largestExpenseAmount) {
                                  largestExpenseAmount = largestPerawatanPribadiTransaction.jumlah;
                                  largestExpenseCategory = 'Perawatan Pribadi';
                                }

                                if (largestBelanjaTransaction != null && largestBelanjaTransaction.jumlah > largestExpenseAmount) {
                                  largestExpenseAmount = largestBelanjaTransaction.jumlah;
                                  largestExpenseCategory = 'Belanja';
                                }

                                if (largestKesehatanTransaction != null && largestKesehatanTransaction.jumlah > largestExpenseAmount) {
                                  largestExpenseAmount = largestKesehatanTransaction.jumlah;
                                  largestExpenseCategory = 'Kesehatan';
                                }

                                if (largestPendidikanTransaction != null && largestPendidikanTransaction.jumlah > largestExpenseAmount) {
                                  largestExpenseAmount = largestPendidikanTransaction.jumlah;
                                  largestExpenseCategory = 'Pendidikan';
                                }

                                if (largestLainnyaTransaction != null && largestLainnyaTransaction.jumlah > largestExpenseAmount) {
                                  largestExpenseAmount = largestLainnyaTransaction.jumlah;
                                  largestExpenseCategory = 'Lainnya';
                                }
                                
                                return Text(
                                  'Rp ${largestExpenseAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                );
                              },
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
                            Consumer<TransaksiProvider>(
                              builder: (context, transaksiProvider, _) {
                                final smallestMakananTransaction =
                                    transaksiProvider.getSmallestExpenseTransaction('Makanan & Minuman');
                                final smallestTransportasiTransaction =
                                    transaksiProvider.getSmallestExpenseTransaction('Transportasi');
                                final smallestKebutuhanRumahTransaction =
                                    transaksiProvider.getSmallestExpenseTransaction('Kebutuhan Rumah');
                                final smallestPerawatanPribadiTransaction =
                                    transaksiProvider.getSmallestExpenseTransaction('Perawatan Pribadi');
                                final smallestBelanjaTransaction =
                                    transaksiProvider.getSmallestExpenseTransaction('Belanja');
                                final smallestKesehatanTransaction =
                                    transaksiProvider.getSmallestExpenseTransaction('Kesehatan');
                                final smallestPendidikanTransaction =
                                    transaksiProvider.getSmallestExpenseTransaction('Pendidikan');
                                final smallestLainnyaTransaction =
                                    transaksiProvider.getSmallestExpenseTransaction('Lainnya');                    
                                // ... tambahkan baris serupa untuk kategori lainnya

                                double smallestExpenseAmount = smallestMakananTransaction?.jumlah ?? 0;
                                String smallestExpenseCategory = 'Makanan & Minuman';

                                if (smallestTransportasiTransaction != null && smallestTransportasiTransaction.jumlah! < smallestExpenseAmount) {
                                  smallestExpenseAmount = smallestTransportasiTransaction.jumlah!;
                                  smallestExpenseCategory = 'Transportasi';
                                }

                                if (smallestKebutuhanRumahTransaction != null && smallestKebutuhanRumahTransaction.jumlah! < smallestExpenseAmount) {
                                  smallestExpenseAmount = smallestKebutuhanRumahTransaction.jumlah!;
                                  smallestExpenseCategory = 'Kebutuhan Rumah';
                                }

                                if (smallestPerawatanPribadiTransaction != null && smallestPerawatanPribadiTransaction.jumlah! < smallestExpenseAmount) {
                                  smallestExpenseAmount = smallestPerawatanPribadiTransaction.jumlah!;
                                  smallestExpenseCategory = 'Perawatan Pribadi';
                                }

                                if (smallestBelanjaTransaction != null && smallestBelanjaTransaction.jumlah! < smallestExpenseAmount) {
                                  smallestExpenseAmount = smallestBelanjaTransaction.jumlah!;
                                  smallestExpenseCategory = 'Belanja';
                                }

                                if (smallestKesehatanTransaction != null && smallestKesehatanTransaction.jumlah! < smallestExpenseAmount) {
                                  smallestExpenseAmount = smallestKesehatanTransaction.jumlah!;
                                  smallestExpenseCategory = 'Kesehatan';
                                }

                                if (smallestPendidikanTransaction != null && smallestPendidikanTransaction.jumlah! < smallestExpenseAmount) {
                                  smallestExpenseAmount = smallestPendidikanTransaction.jumlah!;
                                  smallestExpenseCategory = 'Pendidikan';
                                }

                                if (smallestLainnyaTransaction != null && smallestLainnyaTransaction.jumlah! < smallestExpenseAmount) {
                                  smallestExpenseAmount = smallestLainnyaTransaction.jumlah!;
                                  smallestExpenseCategory = 'Lainnya';
                                }
                                // ... tambahkan baris serupa untuk kategori lainnya

                                return Text(
                                  'Rp ${smallestExpenseAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                );
                              },
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
