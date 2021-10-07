

import 'package:flutter/material.dart';
import 'package:pos_wappsi/screens/Authentication/login_form.dart';
import 'package:pos_wappsi/screens/SplashScreen/on_board.dart';
import 'package:pos_wappsi/screens/SplashScreen/splash_screen.dart';
import 'package:pos_wappsi/screens/cash_accounting/open.dart';
import 'package:pos_wappsi/screens/db_sync/db_sync.dart';
import 'package:pos_wappsi/screens/home/home.dart';
// import 'package:pos_wappsi/screens/products/products.dart';
// import 'package:pos_wappsi/screens/sales/sale_cart.dart';


class Routes {

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
        '/':          (context) => const SplashScreen(),
        '/home' :  (context)    => const Home(),
        '/onBoard':   (context) => const OnBoard(),
        '/loginForm': (context) => const LoginForm(),
        '/cash' :     (context) => const OtpPage(),
        '/db_sync' :  (context) => const DBSync(),
        // '/newSale' :  (context) => NewSale(),
        // '/stock' :  (context) => const Products(),


    };
  }
}