import 'package:flutter/material.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFDCE4FF),
      body: Center(
        child: Text('This is a Akun Page',style: TextStyle(fontSize: 40),),
      ),
    );
  }
}