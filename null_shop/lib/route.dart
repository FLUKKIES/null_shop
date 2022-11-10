import 'package:flutter/material.dart';
import 'package:null_shop/screen/add_product.dart';
import 'package:null_shop/screen/home_screen.dart';
import 'package:null_shop/screen/login_screen.dart';
import 'package:null_shop/screen/product_info_screen.dart';
import 'package:null_shop/screen/profile_screen.dart';
import 'package:null_shop/screen/register_screen.dart';
import 'package:null_shop/screen/top_up_screen.dart';
import 'package:null_shop/screen/transaction_screen.dart';
import 'package:null_shop/screen/withdraw_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Homescreen(),
  "/add-product": (BuildContext context) => AddProduct(),
  "/info-product": (BuildContext context) => MyInfoScreen(),
  "/profile": (BuildContext context) => ProfileScreen(),
  "/top-up": (BuildContext context) => TopUpScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/transaction": (BuildContext context) => TransactionScreen(),
  "/register": (BuildContext context) => RegisterScreen(),
  "/withdraw": (BuildContext context) => WithdrawScreen(),
};
