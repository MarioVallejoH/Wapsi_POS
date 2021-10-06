// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:pos_wappsi/components/button_global.dart';
import 'package:pos_wappsi/providers/cash_accounting_form_provider.dart';
import 'package:pos_wappsi/utils/alerts.dart';
import 'package:pos_wappsi/utils/regExp.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class OpenForm extends StatefulWidget {
  OpenForm({Key? key}) : super(key: key);

  @override
  _OpenFormState createState() => _OpenFormState();
}

class _OpenFormState extends State<OpenForm> {

    late FocusNode _value;

  @override
  void initState() {
    super.initState();
    _value = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _value.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cashAccountingForm = Provider.of<CashAccountingFormProvider>(context);
    return Center(
      child: _form(context, cashAccountingForm),
    );
  }

  Form _form(BuildContext context, CashAccountingFormProvider cashAccForm) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: cashAccForm.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _input(context, cashAccForm),
          const SizedBox(height: 15.0),
          _button(context, cashAccForm),
        ],
      ),
    );
  }

  ButtonGlobalWithoutIcon _button(
      BuildContext context, CashAccountingFormProvider cashAccForm) {
    return ButtonGlobalWithoutIcon(
      buttontext: 'Abrir',
      onPressed: () => _sendInicalCashAcc(context, cashAccForm),
      buttonDecoration:
          kButtonDecoration.copyWith(color: Theme.of(context).primaryColor),
    );
  }

  Padding _input(BuildContext context, CashAccountingFormProvider cashAccForm) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        focusNode: _value,
        autofocus: true,
        style: const TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
          border: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          // hintText: '\$ 0.0'
        ),
        onFieldSubmitted: (_) => _sendInicalCashAcc(context, cashAccForm),
        validator: (value) {
          if (value!.length > 0) {
            return numericRegex.hasMatch(value)
                ? null
                : 'El valor ingresado no es valido';
          }
        },
        onChanged: (value) {
          cashAccForm.value = value;
        },
      ),
    );
  }

  _sendInicalCashAcc(
      BuildContext context, CashAccountingFormProvider cashAccForm) async{
    
    _value.unfocus();


    
    if(await choiceAlert(context, 'No ha digitado un valor, el valor por defecto es \$ 0.0. ¿Desea continuar?', 'assets/images/alert.png')){

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Abriendo caja...'),
          backgroundColor: Colors.lightGreen,
          duration: Duration(seconds: 15),
        ));

        // TODO: method to send data to API, if fails return isLoading to false and set focus on value field

        // diable login button
        cashAccForm.isLoading = true;

        await Future.delayed(Duration(seconds: 2));

        // hide loading snackbar
        ScaffoldMessenger.of(context).hideCurrentSnackBar();




      // TODO: Connect with DB and save response into bloc_cash_accounting
      if (cashAccForm.isValidForm()) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.pushNamed(context, '/home');
        });
      }

    }else{
      _value.requestFocus();
    }
    
    
  }
}
