// ignore: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_wappsi/screens/Notifications/notification_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pos_wappsi/screens/home/components/grid_items.dart';
import 'package:pos_wappsi/screens/home/components/home_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> sliderList = [
    {
      "icon": 'assets/images/banner1.png',
    },
    {
      "icon": 'assets/images/banner2.png',
    }
  ];
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _appBar(),
          _optionsMessage(),
          _options(),
          _newsMessage(),
          _news(),
        ],
      ),
    );
  }

  // appbar widgets
  Widget _appBar() {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            _profile_image(),
            SizedBox(
              width: 10.0,
            ),
            _userKind(),
            Spacer(),
            _cash(),
            SizedBox(
              width: 10.0,
            ),
            _notifications()
          ],
        ),
      ),
    );
  }

  // display information about user in system
  Widget _userKind() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rieyad Store',
          style: GoogleFonts.poppins(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          'Free Plan',
          style: GoogleFonts.poppins(
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).primaryTextTheme.bodyText1!.color,
          ),
        ),
      ],
    );
  }

  // display image from user and allows to go to user data
  Widget _profile_image() {
    return GestureDetector(
      onTap: () {
        // ProfileDetails().launch(context);
      },
      child: Image(
        image: AssetImage('assets/images/profile.png'),
        height: 42,
        width: 42,
      ),
    );
  }

  // show how much money do the user have in cash_register
  Widget _cash() {
    return Container(
      height: 40.0,
      width: 86.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFFD9DDE3).withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          '\$ 450',
          style: GoogleFonts.poppins(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // show notification icon and shows notification's page
  Widget _notifications() {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).primaryTextTheme.bodyText2!.color,
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            NotificationScreen().launch(context);
          },
          child: Icon(
            Icons.notifications_active,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  // message above app options
  Widget _optionsMessage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Funcionalidades',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  // aplciation functions
  Widget _options() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1,
        crossAxisCount: 4,
        children: List.generate(
          freeIcons.length,
          (index) => FittedBox(
            fit: BoxFit.fitWidth,
            child: HomeGridCards(
              gridItems: freeIcons[index],
            ),
          ),
        ),
      ),
    );
  }


  // mesage above news
  Widget _newsMessage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Novedades',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }


  // display some news and novelties
  Widget _news() {
    return Container(
      height: 150,
      width: 320,
      child: PageView.builder(
        pageSnapping: true,
        itemCount: sliderList.length,
        controller: pageController,
        onPageChanged: (int index) {},
        itemBuilder: (_, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                sliderList[index]['icon'],
              ),
            ],
          );
        },
      ),
    );
  }
}

