
import 'package:flutter/material.dart';

import 'package:pos_wappsi/components/button_global.dart';
import 'package:pos_wappsi/providers/login_form_provider.dart';
import 'package:pos_wappsi/screens/Authentication/components/login_form.dart';
import 'package:pos_wappsi/screens/Authentication/components/login_logo.dart';
import 'package:provider/provider.dart';


import '../../constant.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                logo(size: _size),
                const SizedBox(
                  height: 30.0,
                ),
                ChangeNotifierProvider(
                  create: (_)  => LoginFormProvider(),
                  child: LoginFormInputs(),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}


