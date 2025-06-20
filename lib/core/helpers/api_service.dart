import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://improved-alien-sharply.ngrok-free.app/';
  final Dio _dio;
  Map<String, dynamic>? headers;
  ApiService(this._dio);
  Future<Map<String, dynamic>> post(
      {required String endPoint, required data, headers}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }
}
