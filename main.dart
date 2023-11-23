import 'package:flutter/material.dart';
import 'start_page.dart';

void main() {
  runApp(MyApp());
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
        body: Home(),
      ),
    );
  }
}
