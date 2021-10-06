

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{
  String user     = '';
  String passsword = '';

  // to enable or disable send loginFormData to backend while waiting for response

  bool _isLoading = false;

  get loading => _isLoading;

  set isLoading(bool value){
    _isLoading=value;
    notifyListeners();
  }

  

  GlobalKey <FormState> formKey = new GlobalKey<FormState>();


  bool isValidForm(){

    return formKey.currentState?.validate() ?? false;

  } 
}