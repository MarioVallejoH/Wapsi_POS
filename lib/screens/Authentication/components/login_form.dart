import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pos_wappsi/components/button_global.dart';
import 'package:pos_wappsi/providers/login_form_provider.dart';

import 'package:provider/provider.dart';

class LoginFormInputs extends StatefulWidget {
  const LoginFormInputs({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormInputsState createState() => _LoginFormInputsState();
}

class _LoginFormInputsState extends State<LoginFormInputs> {
  late FocusNode passwordFocusNode;

  late FocusNode userFocusNode;

  @override
  void initState() {
    super.initState();
    userFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    userFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginForm.formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _userName(loginForm),
            SizedBox(
              height: 15,
            ),
            _pasword(context, loginForm),
            SizedBox(
              height: 30,
            ),
            _loginButton(context, loginForm)
          ],
        ),
      ),
    );
  }

  Widget _pasword(BuildContext context, LoginFormProvider loginForm) {
    return AppTextField(
      controller: TextEditingController(), // Optional
      textFieldType: TextFieldType.PASSWORD,
      isPassword: true,
      focus: passwordFocusNode,

      validator: (value) {
        if (value!.length < 6) {
          return "La contraseña debe tener minimo 6 caracteres";
        }
      },
      onChanged: (value) {
        loginForm.user = value;
      },
      onFieldSubmitted: (_) => _login(loginForm, context),
      decoration: InputDecoration(
        
        enabledBorder: OutlineInputBorder(),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
        prefixIcon: Icon(Icons.password),
        labelText: 'Contraseña',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _userName(LoginFormProvider loginForm) {
    return TextFormField(
      // textFieldType: TextFieldType.USERNAME,
      // focus: userFocusNode,
      focusNode: userFocusNode,
      // controller: TextEditingController(),
      keyboardType: TextInputType.text,
      initialValue: loginForm.user,
      // nextFocus: passwordFocusNode,
      
      validator: (value) {
        if (value!.length == 0) {
          return "Debe suministrar un nombre de usuario";
        }
      },
      onChanged: (value) {
        loginForm.passsword = value;
      },
      onFieldSubmitted: (_){
        passwordFocusNode.requestFocus();
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
          labelText: 'Nombre de usuario',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.person_pin_sharp)),
    );
  }

  ButtonGlobalWithoutIcon _loginButton(
      BuildContext context, LoginFormProvider loginForm) {
    return ButtonGlobalWithoutIcon(
        buttontext: 'Iniciar sesión',
        
        buttonDecoration: BoxDecoration(
          
          borderRadius: BorderRadius.all(
            Radius.circular(5),

          ),
          // to change color based on _isloading property
          color: loginForm.loading?Colors.grey:Theme.of(context).primaryColor
        ),
        onPressed: loginForm.loading ? null : () =>_login(loginForm, context)
    );
  }

  _login(LoginFormProvider loginForm, BuildContext context) async {
    if (loginForm.isValidForm()) {
      // hide keyboard
      passwordFocusNode.unfocus();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Procesando incio de sesión...'),
        backgroundColor: Colors.lightGreen,
        duration: Duration(seconds: 15),
      ));

      // TODO: method to send data to API, if fails return isLoading to false and set focus on username field

      // diable login button
      loginForm.isLoading = true;

      await Future.delayed(Duration(seconds: 2));

      // hide loading snackbar
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      WidgetsBinding.instance!.addPostFrameCallback((_) {
        // TODO: Validate if cash_accounting is already opened, if true then we dont neet to open it again
        // and we need to load its value to cashAccountingProvider
        
        // TODO: use Navigator.psuhReplacementName() instead of pushNamed
        loginForm.isLoading=false;
        Navigator.pushNamed(context, '/cash');
      });
    }else{
      userFocusNode.requestFocus();
    }
  }
}
