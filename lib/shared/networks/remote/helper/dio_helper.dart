import 'package:dio/dio.dart';

import '../../end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }

  static Future<Response?>  postData({
    Map<String, dynamic>? query,
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio?.post(url, queryParameters: query, data: data);
  }
}
