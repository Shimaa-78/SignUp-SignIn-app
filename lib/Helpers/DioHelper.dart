import 'package:dio/dio.dart';

class DioHelper {
  DioHelper._();
  static  Dio _dio= Dio(
      BaseOptions(
        baseUrl:"https://student.valuxapps.com/api/",
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          "lang": "en",
          "Content-Type": "application/json",
        },
      ),
    );
  

  static Future<Response> PostData({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.post(
      path,
      queryParameters: queryParameters,
      data: body,
    );
    return response;
  }
}
