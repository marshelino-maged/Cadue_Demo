import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/constants/sentences_getter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.onSaved, required this.validator, required this.onChanged});
  final void Function(String?) onSaved;
  final String? Function(String?) validator;
  final void Function(String?) onChanged;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: SentencesGetter.passwordHint,
        hintStyle: GoogleFonts.jost(fontWeight: FontWeight.w400, fontSize: 14, color: ColorsGetter.inputFormHint),
        labelText: SentencesGetter.passwordLabel,
        labelStyle: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: 12, color: ColorsGetter.inputFormLabel),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: isHiddenPassword
              ? Image.asset(ImagesGetter.eyeIcon)
              : Icon(
                  Icons.remove_red_eye,
                  color: ColorsGetter.inputFormHint,
                ),
          // onPressed: onPressed,
          onPressed: () {
            setState(() {
              isHiddenPassword = !isHiddenPassword;  
            });
          },
        ),
      ),
      obscureText: isHiddenPassword,
      obscuringCharacter: SentencesGetter.passwordHiddenCharacter,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
