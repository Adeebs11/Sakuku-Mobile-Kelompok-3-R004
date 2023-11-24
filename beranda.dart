import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 567,
                  color: Color(0xFFA2AFD7),
                ),
                // Add other widgets here as needed
              ],
            ),
          ),
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      height: 49,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavItem('Beranda', Icons.home),
          buildNavItem('Budget', Icons.attach_money),
          buildNavItem('Transaksi', Icons.swap_horiz),
          buildNavItem('Akun', Icons.person),
        ],
      ),
    );
  }

  Widget buildNavItem(String title, IconData iconData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 25,
          color: Color(0xFF898989),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF898989),
            fontSize: 11,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
