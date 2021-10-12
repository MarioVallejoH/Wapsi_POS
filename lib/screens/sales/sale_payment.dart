import 'package:flutter/material.dart';
import 'package:pos_wappsi/components/back_app_bar.dart';
import 'package:pos_wappsi/components/basic_widgets.dart';

class SalePayment extends StatefulWidget {
  SalePayment({Key? key}) : super(key: key);

  @override
  _SalePaymentState createState() => _SalePaymentState();
}

class _SalePaymentState extends State<SalePayment> {
  late Color _pc;

  @override
  Widget build(BuildContext context) {
    _pc = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: appBar(context, _text()),
      body: _body(),
    );
  }

  Widget _text() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          'Metodo de pago',
          style:
              Theme.of(context).textTheme.subtitle2!.apply(fontSizeFactor: 1),
        ),
      ],
    );
  }

  Widget _body() {
    return _form();
  }

  Widget _form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: informationText('\$ 100.111', 'Total a pagar', _pc),
        )
      ],
    );
  }
}
