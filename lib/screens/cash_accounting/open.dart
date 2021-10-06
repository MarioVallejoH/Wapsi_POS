import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_wappsi/screens/cash_accounting/components/open.dart';
import 'package:pos_wappsi/constant.dart';
import 'package:pos_wappsi/providers/cash_accounting_form_provider.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _title(),
                _message(),
                ChangeNotifierProvider(
                  create: (_) => CashAccountingFormProvider(),
                  child: OpenForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _message() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "Digite el valor con el que desea abrir la caja (COP)",
        maxLines: 3,
        
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: kGreyTextColor,
          fontSize: 20.0,
        ),
      ),
    );
  }

  Text _title() {
    return Text(
      'Abrir caja',
      style: GoogleFonts.poppins(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
