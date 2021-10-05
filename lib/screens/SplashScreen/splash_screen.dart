import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:pos_wappsi/constant.dart';
import 'package:pos_wappsi/screens/SplashScreen/on_board.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    defaultBlurRadius = 10.0;
    defaultSpreadRadius = 0.5;

    finish(context);
    const OnBoard().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage('assets/images/wappsi.png'),
            ),
            Center(
              child: Text(
                'Powered By Wappsi',
                style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryTextTheme.bodyText1!.color,
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
            ),
            Center(
              child: Text(
                'V 1.0.0',
                style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryTextTheme.bodyText1!.color,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
