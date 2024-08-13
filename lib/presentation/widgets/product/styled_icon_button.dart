import 'package:demo_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StyledIconButton extends StatelessWidget {
  const StyledIconButton({super.key, required this.onPressed, required this.icon});
  final void Function() onPressed;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.white255),
      ),
      constraints: const BoxConstraints(
        maxWidth: 30,
        maxHeight: 30,
      ),
      iconSize: 15,
      icon: icon,
      color: AppColors.black26,
      onPressed: onPressed,
    );
  }
}
