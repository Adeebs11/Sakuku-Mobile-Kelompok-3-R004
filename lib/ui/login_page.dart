import 'package:flutter/material.dart';
import 'package:sakuku_mobile/sakuku.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Masuk Akun',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFD1DCFF),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 50.0),
            Column(
              children: <Widget>[
                // Image.asset('assets/diamond.png'), // Hapus gambar asset
                const SizedBox(height: 16.0),
                Text(
                  'SakuKu',
                  style: TextStyle(
                    color: Color(0xFFF7F7F7),
                    fontSize: 50,
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
              ],
            ),
            const SizedBox(height: 50.0),
            Container(
              height: 300,
              padding: const EdgeInsets.all(30.0), // Padding untuk kotak
              decoration: BoxDecoration(
                color: Colors.white, // Warna latar belakang kotak
                borderRadius: BorderRadius.circular(5.0), // Bentuk sudut kotak
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color.fromARGB(40, 0, 0, 0),
                          ),
                          filled: true, // Gunakan latar belakang penuh
                          fillColor:
                              Color(0xFFBBCBFF), // Atur warna latar belakang
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(40, 0, 0, 0),
                          ),
                          filled: true, // Gunakan latar belakang penuh
                          fillColor:
                              Color(0xFFBBCBFF), // Atur warna latar belakang
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: 35.0, // Tentukan tinggi sesuai keinginan
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Beranda2Page()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF8EA9FF),
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
// Tentukan lebar sesuai keinginan

                  SizedBox(height: 35.0),
                  RichText(
                    text: TextSpan(
                      text: 'Belum Mempunyai Akun? ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Daftar',
                          style: TextStyle(
                            color: Colors.blue, // Warna teks Daftar
                            decoration: TextDecoration
                                .underline, // Memberikan garis bawah
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
