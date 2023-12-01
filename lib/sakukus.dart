import 'package:flutter/material.dart';
import 'package:sakuku_mobile/akun_page.dart';
import 'package:sakuku_mobile/beranda_page.dart';
import 'package:sakuku_mobile/budget_page.dart';
import 'package:sakuku_mobile/transaksi_page.dart';

class Beranda2Page extends StatefulWidget {
  const Beranda2Page({super.key});

  @override
  State<Beranda2Page> createState() => _Beranda2PageState();
}

class _Beranda2PageState extends State<Beranda2Page> {
  int myCurrentIndex = 0;
  List pages = [
    BerandaPage(),
    BudgetPage(),
    TransaksiPage(),
    AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color(0xFFA1B9FF),
        unselectedItemColor: Color(0xFFA1B9FF),
        //fixedColor: Color(0xFFA1B9FF),
        onTap: (index) {
          setState(() {
            myCurrentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFFA1B9FF),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Budget',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transaksi',
            backgroundColor: Color(0xFFA1B9FF),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
            backgroundColor: Color(0xFFA1B9FF),
          ),
        ],
      ),
      body: pages[myCurrentIndex],
    );
  }
}
