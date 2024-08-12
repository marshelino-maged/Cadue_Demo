import 'package:demo_project/data/services/forget_password_service.dart';

class ForgetPasswordRepo {
  final _forgetPasswordService = ForgetPasswordService();

  Future<bool> resetPwOtp(String countryCode, String phoneNumber) async {
    return await _forgetPasswordService.resetPwOtp(countryCode, phoneNumber);
  }

  Future<bool> verifyOtp(String countryCode, String phoneNumber, String code) async {
     return await _forgetPasswordService.verifyOtp(code, countryCode, phoneNumber);
  }

  Future<bool> resetPassword(String countryCode, String phoneNumber, String pw1, String pw2) async {
    return await _forgetPasswordService.resetPassword(countryCode, phoneNumber, pw1, pw2);
  }
}