import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:pos_wappsi/constant.dart';

// import 'package:pos_wappsi/constant.dart';

class DataProvider {
  String host = 'http://localhost:8080';
  // POST petitons
  Future<Map<String, dynamic>> postPetition(
      String endpoint, Map authData, Map<String, String> headers) async {
    var resp;
    String body = jsonEncode(authData);
    Uri url = Uri(host: host, path: '/api/$endpoint');

    try {
      resp = await http
          .post(url, body: body, headers: headers)
          .timeout(Duration(seconds: 15), onTimeout: () {
        throw TimeoutException('Now answer, try again.');
      });

      // print('xd');

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        return {'status': 1, 'body': json.decode(resp.body)};
      } else {
        // print(resp.statusCode);
        return {'status': 2, 'body': json.decode(resp.body)};
      }
    } on SocketException {
      return {
        'status': 1,
        'body': {
          'messages': 'Verify your internet connection',
        }
      };
      // controlador = 'sinConexion';
    } on http.ClientException {
      // print('ClientException');
      return {
        'status': 2,
        'body': {
          'messages': 'Something went wrong, try again',
        }
      };
    } on TimeoutException {
      return {
        'status': 3,
        'body': {
          'messages': 'No answer, try again',
        }
      };
    } catch (e) {
      return {
        'status': 0,
        'body': {
          'messages': 'Failed request',
        }
      };
    }
  }

  // GET
  Future<Map<String, dynamic>> getPetition(
      String endpoint, Map<String, String> headers) async {
    var resp;
    Uri url = Uri(host: 'URL', path: '/api/$endpoint');
    try {
      resp = await http
          .get(url, headers: headers)
          .timeout(Duration(seconds: 15), onTimeout: () {
        throw TimeoutException('Now answer, try again.');
      });

      if (resp.statusCode == 200) {
        return {'body': json.decode(resp.body), 'status': 1};
      } else if (resp.statusCode == 401) {
        return {'status': 2, 'msg': json.decode(resp.body)['msg']};
      } else {
        // print(resp.statusCode);
        return {
          'status': 3,
          'msg': 'Something went wrong, try again!',
          'body': null
        };
      }
    } on SocketException {
      return {
        'status': 1,
        'msg': 'Verify your internet connection',
        'body': null
      };
      // controlador = 'sinConexion';
    } on http.ClientException {
      // print('ClientException');
      return {
        'status': 2,
        'msg': 'Something went wrong, try again',
        'body': null
      };
    } on TimeoutException {
      return {'status': 3, 'msg': 'No answer, try again', 'body': null};
    } catch (e) {
      return {'status': 0, 'msg': 'Failed request', 'body': null};
    }
  }

  // DELETE

  // Future<Map<String,dynamic>> deletePetition
  //       (String endpoint,{Map<String, String> headers}) async {
  //   var resp;
  //   String _url = URL + '/api/$endpoint';
  //   try {
  //     resp = await http.delete(
  //       _url,
  //       headers: headers
  //     ).timeout(
  //       Duration(seconds: 15),
  //       onTimeout: (){
  //         throw TimeoutException('Now answer, try again.');
  //       }
  //     );

  //     if (resp.statusCode == 200) {
  //       return {
  //         'body':json.decode(resp.body),
  //         'status':1
  //       };
  //     }else if(resp.statusCode == 401){
  //       return {
  //         'status': 2,
  //         'msg': json.decode(resp.body)['msg']
  //       };
  //     }else {
  //       // print(resp.statusCode);
  //       return {'status': 3, 'msg': 'Something went wrong, try again!', 'body': null};
  //     }
  //   }

  //   on SocketException {
  //     return {'status': 1, 'msg': 'Verify your internet connection', 'body': null};
  //       // controlador = 'sinConexion';
  //   } on http.ClientException {
  //     // print('ClientException');
  //     return {'status': 2, 'msg': 'Something went wrong, try again', 'body': null};
  //   } on TimeoutException {
  //     return {'status': 3, 'msg': 'No answer, try again', 'body': null};
  //   }

  //   catch (e) {
  //     return {'status': 0, 'msg': 'Failed request', 'body': null};
  //   }
  // }
}
