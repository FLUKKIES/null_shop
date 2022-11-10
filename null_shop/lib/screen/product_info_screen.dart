import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:null_shop/themes/color.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //พื้นหลัง
        backgroundColor: kColorsWhite,
        //ปุ่มย้อนหลับ
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context, "/home");
          },
        ),
        //ปุ่ม Icon ด้านซ้ายมือ
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/withdraw");
              },
              icon: SvgPicture.asset(
                "assets/icons/edit.svg",
                color: kColorsPurple,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/msg.svg",
                color: kColorsPurple,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
              icon: SvgPicture.asset(
                "assets/icons/me.svg",
                color: kColorsPurple,
              ))
        ],
        //เงาของเส้นคั่น
        elevation: 0,
        //เส้นคั่น
        shape: Border(bottom: BorderSide(width: 1.5, color: kColorsCream)),
        //ความสูงของ AppBar
        toolbarHeight: 60,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: Image.asset('assets/image/logo_cat1.jpg'),
                decoration: BoxDecoration(color: kColorsCream),
              )),
          //ข้อความ
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, right: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cat",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Meaw Meaw",
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w800,
                      color: kColorsPurple),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "\$ Infinity",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                      color: kColorsRed),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Quantity : 1",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kColorsPurple),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Description : The cat is always Affective Disorder",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 102, 102, 102))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
