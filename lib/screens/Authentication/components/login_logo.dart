import 'package:flutter/material.dart';

class logo extends StatelessWidget {
  const logo({
    Key? key,
    required Size size,
  }) : _size = size, super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: _size.width*0.8,
      height: _size.height*0.2,
      child: Image.asset(
        'assets/images/wappsi.jpg',
        fit: BoxFit.contain,
      )
    );
  }
}