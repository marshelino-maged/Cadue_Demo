import 'package:demo_project/presentation/screens/login/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountViewModel {

  final isLogingOut = StateProvider<bool>((ref) => false);
  void logout(context, WidgetRef ref) async {
    ref.read(isLogingOut.notifier).state = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    ref.read(isLogingOut.notifier).state = false;
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const LoginScreen(),
      withNavBar: false,
    );
  }
}
