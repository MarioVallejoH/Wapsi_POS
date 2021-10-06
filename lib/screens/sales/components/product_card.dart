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

  // late Size _size;
  @override
  Widget build(BuildContext context) {
    // _size = MediaQuery.of(context).size;
    return Card(
      elevation: 5, 
      child: _productTile(),

    );
  }

  Widget _productTile() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      // textBaseline: TextBaseline.alphabetic,
      verticalDirection: VerticalDirection.down,
      children: [
        Flexible(
          flex: 4,
          child: _productImage(),
        ),
        Flexible(
          flex: 9,
          child: _productInfo(),
        ),
        
      ],
    );
  }

  Widget _productInfo() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Flexible(
                flex: 4,
                child: _productDesc()
              ),
              Flexible(
                flex: 1,
                child: _delete()
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _qty(),
              // TODO: Define how to obtain product price based on parameters
              _productPrice(),
          
            ]
          ),
          
        ],
      );
  }


  // TODO: Load product description properly
  Padding _productDesc() {
    return Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            widget.name,
          ),
        );
  }

  Widget _productPrice() {
    return Container(
      child: Text('\$ 0'),
      padding: EdgeInsets.only(right: 20),
      );
  } 

  Container _productImage() {
    return Container(
      padding: EdgeInsets.only(right: 15),
      child: FadeInImage(
        image: NetworkImage(
          'https://forocapitalpymes.com/wp-content/uploads/2018/10/MatrizBCG_CocaCola.png',
        ),
        placeholder: AssetImage('assets/images/image.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _qty() {
    return Container(
      // width: 104,
      // alignment: Alignment.centerLeft,
      // color: Colors.red,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,

        children: [
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_quantity > 1) {
                    _quantity -= 1;
                  }
                });
              },
              child: Icon(
                Icons.remove,
                color: Colors.black,
                // size: 1
                // ,
              ),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), elevation: 5, primary: Colors.white),
            ),
          ),
          Flexible(
            flex: 1,
              // color: Colors.red,
              // padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                _quantity.toString(),
                style: Theme.of(context).textTheme.headline6,
              )),
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  // TODO: Validate max stock
                  _quantity += 1;
                });
              },
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), elevation: 5, primary: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _delete() {
    // Delete a prodcut from sales's cart (bloc_sale)
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete),
        iconSize: 30,
        color: Colors.redAccent,
      ),
    );
  }
}
