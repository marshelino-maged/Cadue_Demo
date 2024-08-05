import 'package:demo_project/data/api_endpoints.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPasswordService {
  final _dio = Dio();
  Future<bool> resetPwOtp(String countryCode, String phoneNumber) async {
    try {
      final response = await _dio.post(ApiEndpoints.resetPwOtp(), data: {
        "user": {"country_code": countryCode, "phone_number": phoneNumber}
      });
      Logger.log(' Api called Successfully', 1);
      if (response.data["message"] == "Success") {
        Logger.log(
            'your OTP : ${response.data["data"]["reset_password_token"]}', 1);
        return true;
      }
    } catch (e) {
      Logger.log('error sending OTP using phone number $e', -1);
    }
    return false;
  }

  Future<bool> verifyOtp(
      String verificationCode, String countryCode, String phoneNumber) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await _dio.post(
        ApiEndpoints.verifyOtp(),
        data: {
          "verification_code": verificationCode,
          "user": {"country_code": countryCode, "phone_number": phoneNumber}
        },
      );
      if (response.data["message"] == "Success") {
        await prefs.setString('token', response.data["data"]["token"]);
        Logger.log('verified success your token: ${prefs.getString('token')}', 1);
        return true;
      }
      else{
        Logger.log('wrong otp or expired', -1);
        return false;
      }
    } catch (e) {
      Logger.log('verified error $e', -1);
      return false;
    }
  }

  Future<bool> resetPassword(
      String countryCode, String phoneNumber, String pw1, String pw2) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");
      _dio.options.headers["Authorization"] = "Bearer $token";
      _dio.options.headers["verification-token"] = token;
      final response = await _dio.post(ApiEndpoints.resetPassword(), data: {
        "user": {
          "country_code": countryCode,
          "phone_number": phoneNumber,
          "password": pw1,
          "password_confirmation": pw2,
        },
        "device": {"device_type": "android", "fcm_token": "dummy"}
      },);
      String newToken = response.data["data"]["extra"]["access_token"];
      await prefs.setString('token', newToken);
      Logger.log('login Successfully', 1);
      return true;
    } catch (e) {
      Logger.log('error $e', -1);
    }
    return false;
  }
}
