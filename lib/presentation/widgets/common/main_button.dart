import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainButton extends StatelessWidget {
  MainButton({super.key, required this.onPressed, required this.text, required this.isEnabled, this.isBordered = false , this.isLoading = false, Color? backgroundColor, Color? foregroundColor}): _backgroundColor = backgroundColor ?? AppColors.lightBlue, _foregroundColor = foregroundColor ?? AppColors.white255;
  final void Function() onPressed;
  final String text;
  final bool isEnabled;
  final bool isLoading;
  final Color _backgroundColor;
  final Color _foregroundColor;
  final bool isBordered;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: isBordered ? 1 : 0,
          color: AppColors.black26,
        ),
      ),
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: isEnabled ? onPressed : null,
        style: TextButton.styleFrom(
          backgroundColor:
              isEnabled ? _backgroundColor : AppColors.grey204,
          foregroundColor: AppColors.white255,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),

        ),
        child: isLoading? const CircularProgressIndicator() : StyledText(
          text,
          fontWeight: FontWeight.w700,
          color: _foregroundColor,
        ),
      ),
    );
  }
}
