import 'package:flutter/material.dart';

class SnackBarHelper {
  static showSnackBar(BuildContext context, {required message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
