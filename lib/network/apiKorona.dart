import 'dart:convert';
import 'package:daily_vity/model/modelKorona.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiKorona {
  Future<List<Corona>> getDataCorona() async {
    var dio = Dio();
     dio.interceptors.add(PrettyDioLogger(responseBody: true,responseHeader: true));
    final response = await dio.get('https://api.kawalcorona.com/indonesia/');
    if (response.statusCode == 200) {
      print('ok');
      List jsonCorona = jsonDecode(jsonEncode(response.data));
      return jsonCorona.map((json) => Corona.fromMap(json)).toList();
    } else {
      print('conn error');
      throw Exception('conn error');
    }
  }
}
