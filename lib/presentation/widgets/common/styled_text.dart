import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.sentence, {super.key, this.fontWeight = FontWeight.w500, this.fontSize = 18, this.color = const Color.fromRGBO(26, 26, 26, 1)});
  final String sentence;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      sentence,
      style: GoogleFonts.jost(fontWeight: fontWeight, fontSize: fontSize, color: color,),
      overflow: TextOverflow.ellipsis,
    );
  }
}
