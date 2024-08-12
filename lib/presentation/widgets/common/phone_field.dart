import 'package:country_picker/country_picker.dart';
import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_sentences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({super.key, required this.onSavedCode, required this.onSavedPhone, required this.onChangedPhone});

  final void Function(String?) onSavedCode;
  final void Function(String?) onSavedPhone;
  final void Function(String?) onChangedPhone;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  var countryCode = '+20';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: TextFormField(
            controller: TextEditingController.fromValue(TextEditingValue(
              text: countryCode,
              selection: TextSelection.collapsed(offset: countryCode.length),
            )),
            showCursor: true,
            onSaved: widget.onSavedCode,            
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: (Country country) {
                  setState(() {
                    countryCode = '+${country.phoneCode}';
                  });
                },
              );
            },
            decoration: InputDecoration(
              labelText: ' ',
              labelStyle: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.inputFormLabel),
              suffixIcon: const Icon(
                (Icons.arrow_drop_down),
                size: 30,
              ),
            ),
            readOnly: true,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: AppSentences.phoneLabel,
              labelStyle: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.inputFormLabel),
              hintText: AppSentences.phoneHint,
              hintStyle: GoogleFonts.jost(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.inputFormHint),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            onSaved: widget.onSavedPhone,
            onChanged: widget.onChangedPhone,
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}
