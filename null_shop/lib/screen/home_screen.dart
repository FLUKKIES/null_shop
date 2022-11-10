import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:null_shop/screen/add_product.dart';
import 'package:null_shop/service/database_sevice.dart';
import 'package:null_shop/themes/color.dart';
import 'package:provider/provider.dart';
// import 'package:null_shop/themes/style.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final databaseService =
        Provider.of<DatabaseService>(context, listen: false);
    return Scaffold( 
      
      appBar: AppBar(
        //ความสุงของ AppBar
        toolbarHeight: 60,
        //เส้นคั่น
        shape: Border(bottom: BorderSide(color: kColorsCream, width: 1.5)),
        //เงา
        elevation: 0,
        backgroundColor: kColorsWhite,
        title: Text(
          "NULLSHOP",
          style: Theme.of(context).textTheme.headline2,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            height: 60,
            width: 50,
            color: Colors.amber,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/add-product");
              },
              icon: SvgPicture.asset('assets/icons/add.svg')),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset('assets/icons/msg.svg')),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
              icon: SvgPicture.asset('assets/icons/me.svg'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.75),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/info-product");
                  },
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          child: Image.asset("assets/image/logo_cat.jpg"),
                          decoration: BoxDecoration(color: kColorsCream),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Produce name",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "\$ Price : ",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: kColorsRed),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
