import 'package:flutter/material.dart';

class SnackbarUtil {
  static void showSnackbar(BuildContext context, String message, {
    Color backgroundColor = Colors.black,
    int durationSeconds = 3,
    String? actionLabel,
    VoidCallback? onAction,
    TextStyle? textStyle,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: textStyle ?? const TextStyle(color: Colors.white),
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: durationSeconds),
      action: actionLabel != null && onAction != null
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onAction,
            )
          : null,
    );

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Clear any existing SnackBars before showing the new one
    scaffoldMessenger.clearSnackBars();
    scaffoldMessenger.showSnackBar(snackBar);
  }
}