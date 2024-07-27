import 'package:demo_project/constants/colors_getter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(this.sentence, {super.key});
  final String sentence;
  @override
  Widget build(BuildContext context) {
    return Text(
      sentence,
      style: GoogleFonts.jost(fontWeight: FontWeight.w700, fontSize: 24, color: ColorsGetter.black26),
    );
  }
}
