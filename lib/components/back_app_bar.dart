import 'package:flutter/material.dart';
import 'package:pos_wappsi/components/basic_widgets.dart';

Widget _back(BuildContext context) {
  return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_ios_sharp));
}

PreferredSize appBar(BuildContext context, Widget text) {
  Size _size = MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize: Size(_size.width, _size.height * 0.12),
    child: Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Row(
            children: [
              _back(context),
              SizedBox(
                width: 10.0,
              ),
              text,
              Spacer(),
              // _cash(),
              SizedBox(
                width: 10.0,
              ),
              wappsiLogo(),
            ],
          ),
        ),
      ),
    ),
  );
}
