import 'package:flutter/material.dart';

Widget wappsiLogo() {
    return Image(
        image: AssetImage('assets/images/wappsi.png'),
        height: 42,
        width: 42,
      );
  }

Widget informationText(String description, String information, Color descColor){
  return TextFormField(
      initialValue: description,
      enabled: false,
      decoration: InputDecoration(
        labelText: information,
        labelStyle: TextStyle(
          color: descColor,
          // fontSize: 15
        )
      ),
    );

}