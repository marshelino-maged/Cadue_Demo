import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_images.dart';
import 'package:demo_project/presentation/screens/bottom_navbar_screen.dart';
import 'package:demo_project/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _moveToNextScreen(context);
    return Scaffold(
      backgroundColor: AppColors.white255,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.cadeauLogo),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void _moveToNextScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      final sharedPref = await SharedPreferences.getInstance();
      final token = sharedPref.getString("token");
      if (token == null || token.isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
        return;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavBarScreen(),
        ),
      );
    });
  }
}