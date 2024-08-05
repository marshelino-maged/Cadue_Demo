import 'package:flutter/material.dart';

abstract class ColorsGetter {
  static Color get white255 => const Color.fromRGBO(255, 255, 255, 1);
  static Color get black26 => const Color.fromRGBO(26, 26, 26, 1);
  static Color get grey204 => const Color.fromRGBO(204, 204, 204, 1);
  static Color get greyLight => const Color.fromRGBO(110, 122, 138, 1);
  static Color get inputFormLabel => const Color.fromRGBO(0, 0, 0, 0.5);
  static Color get inputFormHint => const Color.fromRGBO(0, 0, 0, 0.25);
  static Color get mainButtonColor => const Color.fromRGBO(63, 171, 174, 1);
  static Color get orange => const Color.fromRGBO(242, 85, 0, 1);
  static Color get grey146 => const Color.fromRGBO(146, 159, 177, 1);
  static Color get grey174 => const Color.fromRGBO(174, 190, 205, 1);
  static Color get grey239 => const Color.fromRGBO(239, 243, 245, 0.4);
  static Color get grey37 => const Color.fromRGBO(37, 42, 52, 1);
}