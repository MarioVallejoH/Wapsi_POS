import 'package:flutter/material.dart';

import '../constant.dart';
import 'button_global.dart';

// ignore: must_be_immutable
class OpenForm extends StatefulWidget {
 OpenForm({
    Key? key,
   required this.pressed,
  }) : super(key: key);
var pressed;
  @override
  _OpenFormState createState() => _OpenFormState();
}

class _OpenFormState extends State<OpenForm> {
  late FocusNode value;

  @override
  void initState() {
    super.initState();
    value = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    value.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                autofocus: true,
                style: const TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) {
                  // nextField(value, value);
                },
              ),
            ),
            const SizedBox(height: 15.0),
            ButtonGlobalWithoutIcon(
              buttontext: 'Abrir',
              onPressed: widget.pressed,
              buttonDecoration:
              kButtonDecoration.copyWith(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}