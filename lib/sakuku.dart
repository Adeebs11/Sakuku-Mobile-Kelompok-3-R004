import 'package:flutter/material.dart';
import 'package:sakuku_mobile/ui/beranda_page.dart';
import 'package:sakuku_mobile/ui/budget_page.dart';
import 'package:sakuku_mobile/ui/transaksi_page.dart';

class Beranda2Page extends StatefulWidget {
  const Beranda2Page({Key? key}) : super(key: key);

  @override
  State<Beranda2Page> createState() => _Beranda2PageState();
}

class _Beranda2PageState extends State<Beranda2Page> {
  int myCurrentIndex = 0;
  List pages = [
    BerandaPage(),
    BudgetPage(),
    TransaksisPage(),
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
        ],
      ),
      body: pages[myCurrentIndex],
    );
  }
}
