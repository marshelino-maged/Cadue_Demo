import 'package:demo_project/utils/logger.dart';
import 'package:dio/dio.dart';

class ApiHelper {

  static Future<dynamic> makeGetRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final dio = Dio();
    final response = await dio.get(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);

    switch (response.statusCode) {
      case 200:
        // Handle success
        // Logger.log('GET request successful', 1);
        return response.data;
      case 404:
        // Handle not found
        Logger.log('Resource not found', -1);
        break;
      case 500:
        // Handle server error
        Logger.log('Internal Server Error', -1);
        break;
      default:
        Logger.log('Unexpected status code: ${response.statusCode}', -1);
        return null;
    }
  }

  static Future<dynamic> makePostRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final dio = Dio();
    final response = await dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

    switch (response.statusCode) {
      case 201 || 200:
        // Handle resource creation success
        // Logger.log('POST request successful: Resource created', 1);
        return response.data;
      case 400:
        // Handle client error
        Logger.log('Bad Request', -1);
        break;
      case 401:
        // Handle authentication error
        Logger.log('Unauthorized', -1);
        break;
      case 500:
        // Handle server error
        Logger.log('Internal Server Error', -1);
        break;
      default:
        Logger.log('Unexpected status code: ${response.statusCode}', -1);
      return null;
    }
  }
}
