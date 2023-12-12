import 'package:flutter/material.dart';
import 'package:sakukumobile/ui/beranda_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakuku',
      initialRoute: '/start', // Tentukan rute awal
      routes: {
        '/': (context) => BerandaPage(),
        // Tambahkan rute lain jika diperlukan
      },
    );
  }
}
