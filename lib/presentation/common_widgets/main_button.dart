import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/presentation/common_widgets/styled_text.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.onPressed, required this.text, required this.isEnabled, this.isLoading = false});
  final void Function() onPressed;
  final String text;
  final bool isEnabled;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: isEnabled ? onPressed : null,
        style: TextButton.styleFrom(
          backgroundColor:
              isEnabled ? ColorsGetter.mainButtonColor : ColorsGetter.grey204,
          foregroundColor: ColorsGetter.white255,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: isLoading? const CircularProgressIndicator() : StyledText(
          text,
          fontWeight: FontWeight.w700,
          color: ColorsGetter.white255,
        ),
      ),
    );
  }
}
