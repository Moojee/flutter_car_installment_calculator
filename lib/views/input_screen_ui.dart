// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/result_screen_ui.dart';
import 'package:image_picker/image_picker.dart';

class InputScreenUI extends StatefulWidget {
  const InputScreenUI({super.key});

  @override
  State<InputScreenUI> createState() => _InputScreenUIState();
}

class _InputScreenUIState extends State<InputScreenUI> {
  //สร้างตัวแปรควบคุม textfilde
  TextEditingController _carPiceCtrl = TextEditingController();
  TextEditingController _interesCtrl = TextEditingController();

  //สร้างตัวแปรควบคุม radio
  int _downCtrl = 10;

  //สร้างตัวแปรควบคุม Dropdonw
  int _monthCtrl = 24;

  // สร้างตัวแปลเก็บรูปที่เลือกจากกล้อง หรือ แกลอรี่
  File? _imageFile;

  // สร้่างเมธตอดเปิดกล้อง
  _openCamera() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickerImage == null) return;

    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  // สร้่างเมธตอดเปิดแกลอรี่
  _openGallery() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickerImage == null) return;

    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  // สร้่างเมธตอด Dialog แจ้งเตือน
  _warniingDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
        ),
        content: Text(
          msg,
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'คำนวณค่างวดรถ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                      onTap: () {
                        // เปิด snackbar ให้ผู้ใช้เลือกเปิดกล้องหรือแกลลอรี่
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  _openCamera();
                                },
                                title: Text('เปิดกล้อง ( open camara)'),
                                leading: Icon(
                                  Icons.camera,
                                  color: Colors.amber,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  _openGallery();
                                },
                                title: Text('เปิดแกลอรี่ ( open gallery)'),
                                leading: Icon(
                                  Icons.image,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ));
                      },
                      child: _imageFile == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/img02.png',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                _imageFile!,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            )),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ราคารถ  (บาท)',
                  ),
                ),
                TextField(
                  controller: _carPiceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนเงินดาวน์  (บาท)',
                  ),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 10,
                      groupValue: _downCtrl,
                    ),
                    Text('10'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 20,
                      groupValue: _downCtrl,
                    ),
                    Text('20'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 30,
                      groupValue: _downCtrl,
                    ),
                    Text('30'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 40,
                      groupValue: _downCtrl,
                    ),
                    Text('40'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 50,
                      groupValue: _downCtrl,
                    ),
                    Text('50'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 60,
                      groupValue: _downCtrl,
                    ),
                    Text('60'),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ระยะเวลาผ่อน (เดือน)',
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: DropdownButton<int>(
                      value: _monthCtrl,
                      isExpanded: true,
                      underline: Container(),
                      onChanged: (int? value) {
                        setState(() {
                          _monthCtrl = value!;
                        });
                      },
                      items: <int>[
                        24,
                        36,
                        48,
                        60,
                        72,
                      ].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value เดือน',
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อัตราดอกเบี้ย  (% / ปี)',
                  ),
                ),
                TextField(
                  controller: _interesCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate UI หากมีปัญหา ให้แสดง Dialg แจ้งเตือน
                    if (_carPiceCtrl.text.isEmpty) {
                      _warniingDialog('ป้อนราคารถด้วยจ้า..');
                    } else if (_interesCtrl.text.isEmpty) {
                      _warniingDialog('ป้อนอัตราดออกเบี้ยด้วยจ้า..');
                    } else {
                      // พร้อมคำณวน
                      //แปลงราคากับอัตรดอกเบี้ยเป็นตัวเลขก่อน (จาก text)
                      double carPrice = double.parse(_carPiceCtrl.text);
                      double interes = double.parse(_interesCtrl.text);

                      //ยอดจัด = ราคารถ ลบ เงินดาวน์
                      double balance = carPrice - (carPrice * _downCtrl / 100);

                      // ดอกเบี้ยที่ต้องจ่ายทั้งหมด = ยอดจัด * อัตราดอกเบี้ย / 100 / 12 (ต่อเดือน) * _monthCtrl (จำนวนเดือน)
                      double totalInterest =
                          (balance * interes / 100 / 12) * _monthCtrl;

                      // ยอดที่ต้องผ่อนต่อเดือน = (ยอดจัด + ดอกเบี้ยที่ต้องจ่ายทั้งหมด) / จำนวนเดือนผ่อน
                      double payPerMonth =
                          (balance + totalInterest) / _monthCtrl;

                      // ส่งผลไปแสดงที่หน้า result โดยเปิดแบบย้อนกลับได้
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreenUI(
                            carPrice: carPrice,
                            payPerMonth: payPerMonth,
                            month: _monthCtrl,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'คำนวณ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _carPiceCtrl.text = '';
                      _downCtrl = 10;
                      _monthCtrl = 24;
                      _interesCtrl.text = '';
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
