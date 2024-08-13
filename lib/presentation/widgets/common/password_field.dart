import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_images.dart';
import 'package:demo_project/constants/app_sentences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  PasswordField(
      {super.key,
      required this.onSaved,
      required this.validator,
      required this.onChanged,
      hint,label}):hintText = hint?? AppSentences.passwordHint, labelText = label?? AppSentences.passwordLabel;

  final void Function(String?) onSaved;
  final String? Function(String?) validator;
  final void Function(String?) onChanged;
  final String hintText;
  final String labelText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.jost(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.inputFormHint),
        labelText: widget.labelText,
        labelStyle: GoogleFonts.jost(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.inputFormLabel),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: isHiddenPassword
              ? Image.asset(AppImages.eyeIcon)
              : Icon(
                  Icons.remove_red_eye,
                  color: AppColors.inputFormHint,
                ),
          onPressed: () {
            setState(() {
              isHiddenPassword = !isHiddenPassword;
            });
          },
        ),
      ),
      obscureText: isHiddenPassword,
      obscuringCharacter: AppSentences.passwordHiddenCharacter,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
