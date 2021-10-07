import 'package:flutter/material.dart';
import 'package:pos_wappsi/components/basic_widgets.dart';
import 'package:pos_wappsi/components/button_global.dart';
import 'package:pos_wappsi/constant.dart';
import 'package:pos_wappsi/screens/sales/sale_cart.dart';
import 'package:nb_utils/nb_utils.dart';

class NewSale extends StatefulWidget {
  NewSale({Key? key}) : super(key: key);

  @override
  _NewSaleState createState() => _NewSaleState();
}

class _NewSaleState extends State<NewSale> {
  // late Size _size;
  late Color _pc;

  @override
  Widget build(BuildContext context) {
    _pc = Theme.of(context).primaryColor;
    // _size = MediaQuery.of(context).size;
    return Scaffold(body: SafeArea(child: _body()));
  }

  // TODO: load form fields based on data
  Widget _body() {
    return Expanded(
      child: _form(),
    );
  }

  Widget _form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _appBar(),
        _userInfo(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _button(context),
        )
      ],
    );
  }

  Widget _userInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          _branchOffice(),
          _document(),
          _warehouse(),
          _sellerInfo(),
          _clients(),
          _clientBranchOffice(),
        ],
      ),
    );
  }

  _branchOffice() {
    return informationText('Información de sucursal', 'Sucursal', _pc);
  }

  Widget _document() {
    return informationText('CFG123', 'Documento', _pc);
  }

  Widget _warehouse() {
    return informationText('Bodega - Floridablanca', 'Bodega', _pc);
  }

  Widget _sellerInfo() {
    return informationText('12232 - Nombres Apellidos', 'Vendedor', _pc);
  }

  Widget _appBar() {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            _back(),
            SizedBox(
              width: 10.0,
            ),
            _text(),
            Spacer(),
            // _cash(),
            SizedBox(
              width: 10.0,
            ),
            wappsiLogo(),
          ],
        ),
      ),
    );
  }

  Widget _back() {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios_sharp));
  }

  Widget _text() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nueva venta',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .apply(fontSizeFactor: 1, fontWeightDelta: 2),
        ),
        Text(
          'Encabezado',
          style:
              Theme.of(context).textTheme.subtitle2!.apply(fontSizeFactor: 1),
        ),
      ],
    );
  }

  Widget _clients() {
    int _value = 1;
    return Expanded(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            labelStyle: TextStyle(
              color: _pc,
            ),
            labelText: 'Cliente'),
        value: _value,
        items: [
          DropdownMenuItem(value: 1, child: Text('Cliente 1')),
          DropdownMenuItem(value: 2, child: Text('Cliente 2')),
          DropdownMenuItem(value: 3, child: Text('Cliente 3')),
        ],
        onChanged: (int? value) {
          setState(() {
            _value = value!;
          });
        },
      ),
    );
  }

  Widget _clientBranchOffice() {
    int _value = 1;
    return Expanded(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            labelStyle: TextStyle(
              color: _pc,
            ),
            labelText: 'Sucursal del cliente'),
        value: _value,
        items: [
          DropdownMenuItem(value: 1, child: Text('Sucursal 1')),
          DropdownMenuItem(value: 2, child: Text('Sucursal 2')),
          DropdownMenuItem(value: 3, child: Text('Sucursal 3')),
        ],
        onChanged: (int? value) {
          setState(() {
            _value = value!;
          });
        },
      ),
    );
  }

  ButtonGlobalWithoutIcon _button(BuildContext context) {
    return ButtonGlobalWithoutIcon(
      buttontext: 'Añadir productos',
      onPressed: () {
        SaleCart().launch(context);
      },
      buttonDecoration:
          kButtonDecoration.copyWith(color: Theme.of(context).primaryColor),
    );
  }
}
