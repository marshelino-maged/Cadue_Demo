import 'package:demo_project/constants/colors_getter.dart';
import 'package:flutter/material.dart';

class StyledIconButton extends StatelessWidget {
  const StyledIconButton({super.key, required this.onPressed, required this.iconPath});
  final void Function() onPressed;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(ColorsGetter.white255),
      ),
      constraints: const BoxConstraints(
        minWidth: 30,
        minHeight: 30,
      ),
      icon: Image.asset(
        iconPath,
      ),
      color: ColorsGetter.black26,
      onPressed: onPressed,
    );
  }
}
