import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/input_screen_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // TODO: implement initState
    // Code delay หน้าจอ 3 วิ แล้วเปิดหน้า input
    Future.delayed(

      // ดีเลย์ 3 วิ
      Duration( 
        seconds: 3
        ), 

      // กระทำ 
      ()=> Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:(context) => InputScreenUI(),
          )

      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img01.png',
              width: 230.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Car Installment',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              'Calculator',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Created by SUTITA DTI-SAU',
              style: TextStyle(
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                color: Colors.lightGreenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
