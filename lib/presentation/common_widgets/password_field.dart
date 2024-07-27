import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/constants/text_style_getter.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.isHiddenPassword, required this.onPressed, required this.onSaved, required this.validator, required this.onChanged});
  final bool isHiddenPassword;
  final void Function() onPressed;
  final void Function(String?) onSaved;
  final String? Function(String?) validator;
  final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: SentencesGetter.passwordHint,
        hintStyle: TextStyleGetter.inputFormHint,
        labelText: SentencesGetter.passwordLabel,
        labelStyle: TextStyleGetter.inputFormLabel,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: isHiddenPassword
              ? Image.asset(ImagesGetter.eyeIcon)
              : Icon(
                  Icons.remove_red_eye,
                  color: ColorsGetter.inputFormHint,
                ),
          onPressed: onPressed,
        ),
      ),
      obscureText: isHiddenPassword,
      obscuringCharacter: SentencesGetter.passwordHiddenCharacter,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
