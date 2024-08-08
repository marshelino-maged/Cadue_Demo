import 'package:demo_project/constants/enums.dart';

class ApiEndpoints {
  static const String _baseUrl = 'https://apistaging.cadeau.com.sa/';
  static const String _version = 'api/v1';

  static String userLogin() => '$_baseUrl/$_version/auth/${UserType.customer.value}/login';
  static String resetPwOtp() => '$_baseUrl/$_version/auth/passwords/${UserType.customer.value}/send_reset_password_info';
  static String verifyOtp() => '$_baseUrl/$_version/auth/passwords/${UserType.customer.value}/verify_otp';
  static String resetPassword() => '$_baseUrl/$_version/auth/passwords/${UserType.customer.value}/reset_password';
  static String getOccasions(int page) => '$_baseUrl/$_version/lookups/occasion_types?page_number=${page.toString()}';
  static String getProducts(int page, int typeId) => '$_baseUrl/$_version/products?occasion_type_id=${typeId.toString()}&page_number=${page.toString()}&page_size=6';
  static String getDetails(int id) => '$_baseUrl/$_version/products/${id.toString()}';
}