import 'package:demo_project/data/services/forget_password_service.dart';

class ForgetPasswordRepo {
  final ForgetPasswordService _forgetPasswordService = ForgetPasswordService();

  Future<bool> checkExist(String countryCode, String phoneNumber) async {
    return await _forgetPasswordService.checkExist(countryCode, phoneNumber);
  }
}