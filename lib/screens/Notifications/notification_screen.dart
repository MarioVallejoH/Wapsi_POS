import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            NotificationCard(
              title: 'Purchase Alarm',
              iconColor: Colors.orange,
              icons: Icons.alarm,
              time: 'June 23, 2021',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adip gravi iscing elit. Ultricies gravida scelerisque arcu facilisis duis in.',
            ),
            NotificationCard(
              title: 'Purchase Confirmed',
              iconColor: Colors.purple,
              icons: Icons.notifications_none_outlined,
              time: 'June 23, 2021',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adip gravi iscing elit. Ultricies gravida scelerisque arcu facilisis duis in.',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.icons,
    required this.title,
    required this.description,
    required this.time,
    required this.iconColor,
  }) : super(key: key);

  final IconData icons;
  final String title;
  final String description;
  final String time;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: iconColor.withOpacity(0.2),
                ),
                child: Center(
                  child: Icon(
                    icons,
                    color: iconColor,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                time,
                style: GoogleFonts.poppins(
                  color: kGreyTextColor,
                  fontSize: 12.0,
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Text(
              description,
              style: GoogleFonts.poppins(
                color: kGreyTextColor,
                fontSize: 14.0,
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
