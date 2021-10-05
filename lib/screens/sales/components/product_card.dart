import 'package:flutter/material.dart';

// class to show product indormation in form of a card

class ProductCard extends StatefulWidget {
  final String name;
  ProductCard({Key? key, required this.name}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Card(elevation: 5, margin: EdgeInsets.all(4), child: _productTile());
  }

  Widget _productTile() {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: FadeInImage(
              image: NetworkImage(
                'https://forocapitalpymes.com/wp-content/uploads/2018/10/MatrizBCG_CocaCola.png',
              ),
              placeholder: AssetImage('assets/images/image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Flexible(
          flex: 6,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(widget.name),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _qty(),
                      // TODO: Define how to obtain product price based on parameters
                      Text('\$ XXXXX'),
                    ]),
              ],
            ),
          ),
        ),
        Flexible(
            flex: 2,
            child: Center(
              child: _delete(),
            ))
      ],
    );
  }

  Widget _qty() {
    return Container(
      // width: 104,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (_quantity > 1) {
                  _quantity -= 1;
                }
              });
            },
            icon: Icon(Icons.remove),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                _quantity.toString(),
                style: Theme.of(context).textTheme.headline6,
              )),
          GestureDetector(
            onTap: () {
              setState(() {
                // TODO: Validate max stock
                _quantity += 1;
              });
            },
            child: Container(
              color: Colors.grey,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  Widget _delete() {
    // Delete a prodcut from sales's cart (bloc_sale)
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.delete),
      iconSize: 40,
      color: Colors.redAccent,
    );
  }
}
