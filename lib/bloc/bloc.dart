
import 'package:rxdart/rxdart.dart';

class Bloc{

  // to save data of forms

  final _nameSingupController = BehaviorSubject<String>();

  // create record
  


  // GETTERS

  Function(String) get changeNameSingup => _nameSingupController.sink.add;






  // get last modified values

  //global data
  
  String get nameSingup => _nameSingupController.value;

  
  

  dispose() {
    _nameSingupController.close();
  }
}

final bloc = Bloc();