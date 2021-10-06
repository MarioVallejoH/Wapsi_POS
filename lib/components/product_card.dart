import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class to show product indormation in form of a card

class ProductCard extends StatefulWidget {
  final String name;
  final onTap;
  ProductCard({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 10,
      child: ListTile(
        onTap: widget.onTap,

        // TODO: Add product image 
        leading: FadeInImage(
          image: NetworkImage(
              'https://forocapitalpymes.com/wp-content/uploads/2018/10/MatrizBCG_CocaCola.png'),
          placeholder: AssetImage('assets/images/image.png'),
        ),
        title: Text(
          widget.name,
          style: GoogleFonts.poppins(
            color: Colors.black,
            // fontWeight: FontWeight.bold,
            // fontSize: 17,
          ),
        ),
        subtitle:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // TODO: load quantity and price for product
          Text('Cantidad: X'),
          Text('\$ XXXXX')
        ]),
      ),
    );
  }
}
