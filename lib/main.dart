import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:milk_tea_shop/constans.dart';
import 'package:milk_tea_shop/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ป้องกันการหมุนโทรศัพท์
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Mali",
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int index;
  List<Widget> screen;
  @override
  void initState() {
    super.initState();
    index = 0;
    screen = [
      HomePage(),
      Center(child: Text("ตะกร้า")),
      Center(child: Text("เมนูที่ชอบ")),
      Center(child: Text("ผู้ใช้")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: screen[index],
      //เริ่ม bottom เมนู
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      assetName1,
                      width: index == 0 ? 24 : 14,
                    ),
                    Text("รายการ")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      assetName2,
                      width: index == 1 ? 24 : 14,
                    ),
                    Text("ตะกร้า")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      assetName3,
                      width: index == 2 ? 24 : 14,
                    ),
                    Text("เมนูที่ชอบ")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      assetName4,
                      width: index == 3 ? 24 : 14,
                    ),
                    Text("ผู้ใช้")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //จบ bottom เมนู
    );
  }
}
