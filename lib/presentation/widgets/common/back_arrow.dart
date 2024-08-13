import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: Navigator.of(context).pop,
          iconSize: 20,
    );
  }
}