import 'package:flutter/material.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pos_wappsi/screens/sales/components/product_card.dart';

import 'package:pos_wappsi/screens/sales/components/search.dart';

class SaleCart extends StatefulWidget {
  SaleCart({Key? key}) : super(key: key);

  @override
  _SaleCartState createState() => _SaleCartState();
}

class _SaleCartState extends State<SaleCart> {


  final actions = [
    // TODO: load cart saved before
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.add_shopping_cart, color: Colors.black,),
          onPressed: () {},
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        color: Colors.black,
        showIfClosed: false,
      ),
      
    ];

  late Size _size;
  late Color _pc;

  @override
  Widget build(BuildContext context) {
    _pc = Theme.of(context).primaryColor;
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _searchbar()
            
    );
  }


  Widget _searchbar(){
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.all(10),
        child: FloatingSearchBar(
          
          clearQueryOnClose: true,
          actions: actions,
          body: _body(),
          transitionCurve: Curves.easeInOutCubic,
          transition: CircularFloatingSearchBarTransition(),
          physics: const BouncingScrollPhysics(),
          builder: (context, _) => buildBody(),

          
          onQueryChanged: _onQueryChanged,
        ),
      ),
    );
  }


  Widget _body(){

    

    return Column(
        children: [

          Flexible(
            flex: 9,
            child: Container(
              
              // height:_size.height*0.78,
            // to avoid overlap with floatingSearchBar
              margin: EdgeInsets.only(top: _size.height*0.08, bottom: 8),
              padding: EdgeInsets.only(top: 10),
              child: ListView(
                children: List.generate(100, (index) => index.toString())
                  .map((e) => ProductCard(name: "Proident laborum veniam velit esse do incididunt officia voluptate mollit ad sit sit cupidatat et." + e))
                  .toList(),
              )
            ),
          ),

         Flexible(
           flex: 1,
           fit: FlexFit.loose,
           child: _total()
          )
        ],
      
    );

  }

  Widget _total(){

    return Container(
      
      height: _size.height*0.1,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: _pc,
      ),

      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 2,
            child: Text('Subtotal: ',
              style: Theme.of(context).primaryTextTheme.headline6,
           )
          ),
          Flexible(
            flex: 2,
            // TODO: print subtotal
            child: Text("\$ xxxxxxx",
              style: Theme.of(context).primaryTextTheme.headline6,
           )
          ),
          ElevatedButton(
            
            onPressed: _send,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Enviar  ',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ],
            )
          )
        ],
      ),
      
      // child: Row(
        
      // ),
    );

  }

  _onQueryChanged(String query){
    // TODO: On query changed get results from db and add to results stream

    debugPrint(query);


  }

  void _send() {
  }
}