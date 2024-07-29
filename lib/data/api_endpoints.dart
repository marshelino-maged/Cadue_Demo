import 'package:demo_project/constants/enums.dart';

class ApiEndpoints {
  static const String _baseUrl = 'https://apistaging.cadeau.com.sa/';
  static const String _version = 'api/v1';

  static String userLogin() => '$_baseUrl/$_version/auth/${UserType.customer.value}/login';
  static String checkExist() => '$_baseUrl/$_version/auth/passwords/${UserType.customer.value}/check_exists';
  
}