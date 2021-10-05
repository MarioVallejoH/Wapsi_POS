

import 'package:flutter/material.dart';
import 'package:pos_wappsi/screens/Authentication/login_form.dart';
import 'package:pos_wappsi/screens/cash_register/open.dart';

import 'package:pos_wappsi/screens/SplashScreen/on_board.dart';
import 'package:pos_wappsi/screens/SplashScreen/splash_screen.dart';
import 'package:pos_wappsi/screens/db_sync/db_sync.dart';

class Routes {

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
        '/':          (context) => const SplashScreen(),
        '/onBoard':   (context) => const OnBoard(),
        '/loginForm': (context) => const LoginForm(),
        '/cash' :     (context) => const OtpPage(),
        '/db_sync' :  (context) => const DBSync(),


    };
  }
}