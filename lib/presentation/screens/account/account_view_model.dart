import 'package:shared_preferences/shared_preferences.dart';

class AccountViewModel {

  //variables
  bool isLogingOut = false;

  //functions
  Future<void> logout(context, Function popBottomNavBar) async {
    
    isLogingOut = true;
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLogingOut = false;
    popBottomNavBar();
  }
}
