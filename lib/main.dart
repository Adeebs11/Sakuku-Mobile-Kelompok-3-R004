import 'package:flutter/material.dart';
import 'package:sakukumobile/ui/start_page.dart';
import 'package:provider/provider.dart';
import 'package:sakukumobile/model/transaksi_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransaksiProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFFA2AFD7),
      ),
      home: Scaffold(
        body: StartPage(),
      ),
    );
  }
}
