import 'dart:io';

import 'package:pos_wappsi/providers/API_provider.dart';

Future<Map<dynamic, dynamic>> login(Map<String, dynamic> data) async {
  DataProvider provider = new DataProvider();

  final resp = await provider.postPetition('login', data, {
    HttpHeaders.contentTypeHeader: 'application/json',
  });

  Map<String, dynamic> decodedResp = resp; //Sin conexión
  if (decodedResp['status'] == 1) {
    return {'status': true, 'body': decodedResp['body']};
  } else {
    return {'status': false, 'body': decodedResp['body']};
  }
}
