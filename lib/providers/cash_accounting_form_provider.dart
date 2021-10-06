
import 'package:flutter/material.dart';

class CashAccountingFormProvider extends ChangeNotifier{
  String value     = '';

  GlobalKey <FormState> formKey = new GlobalKey<FormState>();

  // to enable or disable send cashAccOpenForm to backend while waiting for response

  bool _isLoading = false;

  get loading => _isLoading;

  set isLoading(bool value){
    _isLoading=value;
    notifyListeners();
  }


  bool isValidForm(){

    if(formKey.currentState!.validate()){
      // in case of no value
      if(value==''){
        value = '0';
      }
      return true;
    }else{
      return false;
    }

    

  } 
}