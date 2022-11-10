import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:null_shop/service/auth_service.dart';
import 'package:null_shop/themes/color.dart';
import 'package:null_shop/widget/coin_menu_widget.dart';
import 'package:null_shop/widget/main_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:null_shop/model/user_model.dart' as model;

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  model.User? user;

  @override
  Widget build(BuildContext context) {
    final AuthService authService =
        Provider.of<AuthService>(context, listen: false);
    authService.currentUser().then((currentUser) {
      setState(() {
        user = currentUser!;
      });
    }).catchError((e) {
      // Close page before download finished.
    });

    return Scaffold(
      backgroundColor: kColorsCream,
      appBar: AppBar(
        backgroundColor: kColorsPurple,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg', color: kColorsWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/msg.svg',
                  color: kColorsWhite)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon:
                  SvgPicture.asset('assets/icons/me.svg', color: kColorsWhite))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileAndCoin(),
            setting(),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InkWell(
                    onTap: () {
                      logoutHandle(context: context);
                    },
                    child: MainBtnWidget(
                        colorBtn: kColorsRed,
                        textBtn: 'Logout',
                        isTransparent: false,
                        haveIcon: false)))
          ],
        ),
      ),
    );
  }

  // Create Profile and Coin Menu
  Widget profileAndCoin() {
    return Stack(
      children: [
        SizedBox(
          height: 325,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          height: 180,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
              color: kColorsPurple),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: kColorsCream),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi ${user?.username ?? "loading..."}',
                      style: Theme.of(context).textTheme.headline3),
                  const SizedBox(height: 10),
                  Text('Email: ${user?.email ?? "loading..."}',
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: kColorsWhite,
                          fontFamily: 'Inter')),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 145,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 155,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: kColorsWhite,
                        boxShadow: [
                          BoxShadow(
                            color: kColorsBlack.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Coin',
                            style: Theme.of(context).textTheme.headline4),
                        Text('\$ ${user?.coin ?? "Loading..."}',
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 1.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: kColorsCream),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/withdraw');
                              },
                              child: CoinMenuWidget(
                                  iconBtn: 'assets/icons/withdraw.svg',
                                  textBtn: 'Withdraw')),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/top-up');
                              },
                              child: CoinMenuWidget(
                                  iconBtn: 'assets/icons/top_up.svg',
                                  textBtn: 'Top Up')),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/transaction');
                              },
                              child: CoinMenuWidget(
                                  iconBtn: 'assets/icons/transaction.svg',
                                  textBtn: 'Transaction')),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // Create Setting Menu
  Widget setting() {
    return Stack(
      children: [
        Container(
          height: 326,
          width: MediaQuery.of(context).size.width,
          color: kColorsWhite,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Setting', style: Theme.of(context).textTheme.headline4),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 1.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: kColorsCream),
                ),
              ),

              // TO DO: Create setting menu
            ],
          ),
        )
      ],
    );
  }

  Future<void> logoutHandle({required BuildContext context}) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    } on FirebaseAuthException catch (e) {
      log(e.message!);
    }
  }
}