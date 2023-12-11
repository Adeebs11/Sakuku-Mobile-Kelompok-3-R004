import 'package:flutter/material.dart';
import 'package:sakuku_mobile/sakuku.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'SakuKu',
          style: TextStyle(
            color: Color(0xFFF7F7F7),
            fontSize: 40,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4), // Atur offset bayangan
                blurRadius: 4.0, // Atur ukuran blur bayangan
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Atur aktivitas keuanganmu dengan SakuKu, aplikasi keuangan untuk kelola rencana finansial dengan mudah, capai tujuan target tabunganmu, dan pantau pengeluaranmu.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Montserrat',
              height: 1.7,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 5),
        Image.asset(
          'assets/images/MainMenu.png', // Gantilah dengan path yang sesuai
          width: 300,
          height: 300,
        ),
        SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Beranda2Page()));
            // Tambahkan aksi yang diinginkan ketika tombol ditekan
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF4F5E8D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Masuk',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
