import 'package:demo_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.sentence,
      {super.key,
      this.fontWeight = FontWeight.w500,
      this.fontSize = 18,
      this.color,
      this.overflow = TextOverflow.ellipsis,
      this.decoration = TextDecoration.none,
      this.maxLines});
  final String sentence;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? color;
  final TextOverflow overflow;
  final TextDecoration decoration;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      sentence,
      style: GoogleFonts.jost(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color ?? AppColors.black26,
          decoration: decoration),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
