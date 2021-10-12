

import 'dart:convert';

import 'package:crypto/crypto.dart';
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


  String _encodePass(){
    var bytes = utf8.encode(passsword); // data being hashed

    var digest = sha1.convert(bytes);
    return digest.toString();
  }

  

  GlobalKey <FormState> formKey = new GlobalKey<FormState>();


  bool isValidForm(){

    return formKey.currentState?.validate() ?? false;

  } 

  Map<String,dynamic> toJson(){
    return {'username':user, 'password':_encodePass()};
  }


}