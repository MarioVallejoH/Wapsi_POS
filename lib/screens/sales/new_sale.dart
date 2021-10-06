import 'package:flutter/material.dart';


class NewSale extends StatefulWidget {
  NewSale({Key? key}) : super(key: key);

  @override
  _NewSaleState createState() => _NewSaleState();
}

class _NewSaleState extends State<NewSale> {


 

  late Size _size;
  late Color _pc;

  @override
  Widget build(BuildContext context) {
    _pc = Theme.of(context).primaryColor;
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _body()
            
    );
  }

  // TODO: load form fields based on data
  Widget _body(){
    return SafeArea(
      child: Container(
        
      ),
    );
  }


  
}