import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/constants/text_style_getter.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.onSaved, required this.onChanged});

  final void Function(PhoneNumber?) onSaved;
  final void Function(PhoneNumber?) onChanged;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        hintText: SentencesGetter.phoneHint,
        hintStyle: TextStyleGetter.inputFormHint,
        labelText: SentencesGetter.phoneLabel,
        labelStyle: TextStyleGetter.inputFormLabel,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
      ),
      initialCountryCode: SentencesGetter.phoneInitialCountryCode,
      onSaved: onSaved,
      onChanged: onChanged,
    );
  }
}
