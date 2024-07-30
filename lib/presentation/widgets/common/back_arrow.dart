import 'package:demo_project/constants/images_getter.dart';
import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
          icon: Image.asset(ImagesGetter.backButton),
          onPressed: Navigator.of(context).pop,
    );
  }
}