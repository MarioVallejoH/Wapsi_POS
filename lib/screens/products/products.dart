import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pos_wappsi/components/product_card.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    
    // avoid errors related to unstability of scaffold with no key
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    
    _theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: FloatingSearchAppBar(
          color: _theme.primaryColor,
          title: const Text(
          
            'Productos',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          transitionDuration: const Duration(milliseconds: 800),
          clearQueryOnClose: true,
          hideKeyboardOnDownScroll: true,
          onQueryChanged: _onQueryChanged,
          colorOnScroll: _theme.primaryColor,
          iconColor: Colors.white,

          body: _productsList()
      ),
    );
  }

  Widget _productsList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 50,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ProductCard(
          name: "Proident laborum veniam velit esse do incididunt officia voluptate mollit ad sit sit cupidatat et. $index" ,
          onTap: () {},
        );
      },
    );
  }

  _onQueryChanged(String query){
    // TODO: search products on query changed

    debugPrint(query);


  }
}
