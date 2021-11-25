import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class HomeController {
  Future<bool> register(Map<String, dynamic> payload) async {
    try {
      final url = Uri.parse('http://localhost:8080/api/v1/tickets');
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'event_id': '0389d251-ad77-4167-8bc3-7b9cd7d857f8',
            'event_type': payload['event_type'],
            'guest': {
              'name': payload['name'],
              'email': payload['email'],
              'phone': payload['phone'],
              'company': payload['company'],
              'job': payload['job'],
            }
          }));

      print(response);
      return response.statusCode < 300;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> uploadCv(Uint8List fileBytes, String fileName) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await Dio().post(
        'http://localhost:8080/api/v1/files',
        options: Options(headers: {"Content-Type": "multipart/form-data"}),
        data: FormData.fromMap({
          'file_name': fileName,
          'file': MultipartFile.fromBytes(fileBytes, filename: fileName)
        }),
      );

      print(response);
      return response.statusCode! < 300;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
