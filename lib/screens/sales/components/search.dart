import 'package:flutter/material.dart';
import 'package:pos_wappsi/components/product_card.dart';

Widget buildBody() {
  
    final time = DateTime.now();
    print('BuildBody at ${time.second}:${time.millisecond}');
    return _productos();
}

Widget _productos(){
  // TODO: Use streambuilder to build this based on products in products_stream
  return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: Column(
          children: List.generate(100, (index) => index.toString())
              .map((e) => ProductCard(name: e, onTap: _addToCart(),),
                  )
              .toList(),
        ),
      ),
    );
}


_addToCart(){
  // TODO: add producto to cart stream
}

