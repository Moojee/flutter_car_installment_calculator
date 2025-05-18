import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreenUI extends StatefulWidget {
  //สร้างตัวแปรรับค่าที่จะส่งมา
  double? carPrice;
  double? payPerMonth;
  int? month;

  //เอาตัวแปรที่สร้าง  มารอรับค่าที่ส่ง
  ResultScreenUI({super.key, this.carPrice, this.payPerMonth, this.month});

  @override
  State<ResultScreenUI> createState() => _ResultScreenUIState();
}

class _ResultScreenUIState extends State<ResultScreenUI> {
  @override
  Widget build(BuildContext context) {
    //กำหนดรูปแบบของตัวเลข ณ ที่นี้ คอมมาคั่นหลักพัน/ล้าน และทศนิยม 2 ตำแหน่ง
    NumberFormat fm = NumberFormat("#,###,##0.00");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'CI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ผ่อนทั้งหมด',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' ${widget.month}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  ' เดือน',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              'ค่างวดรถต่อเดือน',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${fm.format(widget.payPerMonth)}',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              'บาท',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
