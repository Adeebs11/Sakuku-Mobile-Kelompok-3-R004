import 'package:flutter/material.dart';

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
        title: Text('Masuk Akun'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Masukkan email Anda',
              ),
            ),
            Text(
              'Kata Sandi',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Masukkan kata sandi Anda',
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // TODO: Kirim permintaan login ke server
              },
              child: Text('Masuk'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Tampilkan halaman daftar akun
              },
              child: Text('Belum mempunyai akun? Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
