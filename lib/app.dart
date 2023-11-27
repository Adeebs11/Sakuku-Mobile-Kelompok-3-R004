import 'package:flutter/material.dart';

import 'login_page.dart';
import 'sakukus.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakuku',
      initialRoute: '/start', // Tentukan rute awal
      routes: {
        '/login': (context) => LoginPage(),
        '/': (context) => Beranda2Page(),
        // Tambahkan rute lain jika diperlukan
      },
    );
  }
}
