import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountViewModel {

  //providers
  final isLogingOut = StateProvider<bool>((ref) => false);

  //functions
  void logout(context, WidgetRef ref, Function popBottomNavBar) async {
    ref.read(isLogingOut.notifier).state = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    ref.read(isLogingOut.notifier).state = false;
    popBottomNavBar();
  }
}
