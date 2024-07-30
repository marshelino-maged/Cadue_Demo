import 'package:demo_project/data/services/login_service.dart';
import 'package:demo_project/data/models/user_model.dart';

class UserRepo {
  final LoginService _loginService = LoginService();
  UserModel? _currentUser;

  Future<bool> login(String countryCode, String phoneNumber, String password) async { 
    _currentUser = await _loginService.login(countryCode, phoneNumber, password);   
    return _currentUser == null ? false : true; 
  }

  UserModel? get currentUser => _currentUser;
}