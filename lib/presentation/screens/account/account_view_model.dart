import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountViewModel {

  //variables
  final isLogingOut = StateProvider<bool>((ref) => false);

  //functions
  Future<void> logout(context, Function popBottomNavBar, WidgetRef ref) async {
    ref.read(isLogingOut.notifier).state = true;
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    ref.read(isLogingOut.notifier).state = false;
    popBottomNavBar();
  }
}
