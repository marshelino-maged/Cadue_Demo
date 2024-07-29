import 'package:demo_project/data/api_endpoints.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:dio/dio.dart';

class ForgetPasswordService {
  final _dio = Dio();
  Future<bool> checkExist(String countryCode, String phoneNumber) async {
    try{
      final response = await _dio.post(ApiEndpoints.checkExist(), data: {
        "user": {
          "country_code": countryCode,
          "phone_number": phoneNumber
        }
      });
      Logger.log('account exists Api called Successfully', 1);
      if(response.data["message"] == "Success"){
        return true;
      }
    } catch(e) {
      Logger.log('error checking for account exist using phone number $e', -1);
    }
    return false;
  }
}