import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/presentation/screens/account/account_screen.dart';
import 'package:demo_project/presentation/screens/login/login_screen.dart';
import 'package:demo_project/presentation/screens/occasions/occasions_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: [OccasionsScreen(), AccountScreen(popBottomNavBar: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));})],
      items: [
        PersistentBottomNavBarItem(
          icon: Image.asset(ImagesGetter.occasionIconActive),
          inactiveIcon: Image.asset(ImagesGetter.occasionIconNotActive),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(ImagesGetter.accountIconActive),
          inactiveIcon: Image.asset(ImagesGetter.accountIconNotActive),
        ),
      ],
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.all(8),
      backgroundColor: ColorsGetter.white255,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.bounceIn,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.simple,
    );
  }
}
