import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:pos_wappsi/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      // TODO: make theme data of app here

      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 97, 224, 1),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            // backgroundColor: MaterialStateProperty.all(Colors.green)
          )
        ),
        primaryTextTheme: TextTheme(
          button: TextStyle(
            color: Colors.white
          ),
          bodyText1: TextStyle(
            color: Colors.black
          ),
          bodyText2: TextStyle(
            color: Colors.white
          ),
          headline6: TextStyle(
            color: Colors.white
          ),
          // primary Theme for text
        ),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.white
        ),
        accentIconTheme: IconThemeData(
          color: Colors.white
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary
        ),
        
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        backgroundColor: Colors.white
      ),

      title: 'Mobile POS',
      initialRoute: '/',
      routes: Routes.getRoutes(),
    );
  }
}
