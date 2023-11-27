import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50.0),
          Row(
            children: [      
              Text('        '),
              Image.asset('assets/images/SakukuLogo.png'),
              Text(
                '                    Hai,',
                style: TextStyle(
                  color: Color.fromARGB(255, 100, 96, 96),
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text(
            'Pengguna',
            style: TextStyle(
              color: Color.fromARGB(255, 58, 57, 57),
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 40, height: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              ContainerWithText('Total Pemasukkan', Colors.white),
              SizedBox(height: 25.0),
              ContainerWithText('Detail Pemasukkan', Colors.white),
              SizedBox(height: 25.0),
              ContainerWithText('Total Pengeluaran', Colors.white),
              SizedBox(height: 25.0),
              ContainerWithText('Detail Pengeluaran', Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerWithText extends StatelessWidget {
  final String text;
  final Color color;

  ContainerWithText(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 70.0,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: const Color.fromARGB(255, 210, 10, 10),
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
