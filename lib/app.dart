import 'package:flutter/material.dart';

import 'login_page.dart';
import 'beranda.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakuku',
      initialRoute: '/start', // Tentukan rute awal
      routes: {
        '/login': (context) => LoginPage(),
        '/': (context) => BerandaPage(),
        // Tambahkan rute lain jika diperlukan
      },
    );
  }
}
