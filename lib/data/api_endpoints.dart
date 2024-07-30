import 'package:demo_project/constants/enums.dart';

class ApiEndpoints {
  static const String _baseUrl = 'https://apistaging.cadeau.com.sa/';
  static const String _version = 'api/v1';

  static String userLogin() => '$_baseUrl/$_version/auth/${UserType.customer.value}/login';
  static String resetPwOtp() => '$_baseUrl/$_version/auth/passwords/${UserType.customer.value}/send_reset_password_info';
  static String verifyOtp() => '$_baseUrl/$_version/auth/passwords/${UserType.customer.value}/verify_otp';
  static String resetPassword() => '$_baseUrl/$_version/auth/passwords/${UserType.customer.value}/reset_password';
  
}