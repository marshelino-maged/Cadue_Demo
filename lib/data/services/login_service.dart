import 'package:demo_project/data/api_endpoints.dart';
import 'package:demo_project/models/user_model.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio();
  Future<UserModel?> login(
    String countryCode,
    String phoneNumber,
    String password,
  ) async {
    try {
      final resposne = await _dio.post(ApiEndpoints.userLogin(), data: {
        "user": {
          "country_code": countryCode,
          "phone_number": phoneNumber,
          "password": password,
        },
        "device": {
          "device_type": "android",
          "fcm_token": "dummy",
        }
      });
      UserModel user = UserModel.fromJson(resposne.data["data"]["user"]);
      Logger.log('login Successfully', 1);
      return user;
    } catch (e) {
      Logger.log('login Failed $e', -1);
      return null;
    }
  }
}
