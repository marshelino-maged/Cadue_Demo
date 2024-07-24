import 'package:demo_project/constants/colors_getter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleGetter {
  static TextStyle get titleBlack => GoogleFonts.jost(fontWeight: FontWeight.w700, fontSize: 24, color: ColorsGetter.black);
  static TextStyle get titleGrey => GoogleFonts.jost(fontWeight: FontWeight.w700, fontSize: 24, color: ColorsGetter.grey);
  static TextStyle get inputForm => GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: 12, color: ColorsGetter.inputForm);
  static TextStyle get inputFormHint => GoogleFonts.jost(fontWeight: FontWeight.w400, fontSize: 14, color: ColorsGetter.inputFormHint);
  static TextStyle get forgetPW => GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: 12, color: ColorsGetter.black);
  static TextStyle get donotHaveAccount => GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: 14, color: ColorsGetter.black);
  static TextStyle get mainButtonText => GoogleFonts.jost(fontWeight: FontWeight.w700, fontSize: 18, color: ColorsGetter.white);
  static TextStyle get loginSignUp => GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: 14, color: ColorsGetter.orange);

}