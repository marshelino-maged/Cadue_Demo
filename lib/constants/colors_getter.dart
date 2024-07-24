import 'package:flutter/material.dart';

abstract class ColorsGetter {
  static Color get white => const Color.fromRGBO(255, 255, 255, 1);
  static Color get black => const Color.fromRGBO(26, 26, 26, 1);
  static Color get grey => const Color.fromRGBO(110, 122, 138, 1);
  static Color get inputForm => const Color.fromRGBO(0, 0, 0, 0.5);
  static Color get inputFormHint => const Color.fromRGBO(0, 0, 0, 0.25);
  static Color get mainButtonColor => const Color.fromRGBO(63, 171, 174, 1);
  static Color get orange => const Color.fromRGBO(242, 85, 0, 1);
  

}