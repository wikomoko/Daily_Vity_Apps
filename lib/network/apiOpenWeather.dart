import 'dart:convert';
import 'package:daily_vity/model/modelWeather.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiOpenWeather {

  Future<OpenWeather> getWeatherData(String lat, String lon) async {
    var dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestHeader: true,requestBody: true,responseBody: true,responseHeader: false,compact: false,));
    final responses = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lon=$lon&lat=$lat&appid=a5c79f4d6b839feffb5371a94f77bbbb&lang=id&units=metric');
    if (responses.statusCode == 200) {
      print('ok');
      return OpenWeather.fromMap(jsonDecode(jsonEncode(responses.data)));
    } else {
      throw Exception('error conn');
    }
  }

 Future<OpenWeather> getWeatherCity(String kota) async {
    var dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestHeader: true,requestBody: true,responseBody: true,responseHeader: false,compact: false,));
    final responses = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$kota&appid=a5c79f4d6b839feffb5371a94f77bbbb&lang=id&units=metric');
    if (responses.statusCode == 200) {
      print('ok');
      return OpenWeather.fromMap(jsonDecode(jsonEncode(responses.data)));
    } else {
      throw Exception('error conn');
    }
  }
}
