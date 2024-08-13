import 'package:demo_project/data/services/login_service.dart';
import 'package:demo_project/data/models/user_model.dart';

class UserRepo {
  final _loginService = LoginService();

  Future<UserModel?> login(String countryCode, String phoneNumber, String password) async { 
    return await _loginService.login(countryCode, phoneNumber, password);    
  }
}