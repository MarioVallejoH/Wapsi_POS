import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:pos_wappsi/screens/home/components/grid_items.dart';

class HomeGridCards extends StatelessWidget {
  const HomeGridCards({Key? key, required this.gridItems}) : super(key: key);
  final GridItems gridItems;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/${gridItems.route}');
            },
            child: Container(
              width: _size.width * 0.2,
              height: _size.height * 0.07,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage(
                  gridItems.icon.toString(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              gridItems.title.toString(),
              maxLines: 1,
              minFontSize: 10,
              stepGranularity: 10,
            ),
          ),
        ],
      ),
    );
  }
}