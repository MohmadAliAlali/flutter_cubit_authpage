import 'package:flutter/material.dart';

class Navigation {
  static void navigateTo(BuildContext context, String screen) {
    Navigator.pushNamed(
      context,
      screen,
    );
  }

  static void navigateAndRemove(BuildContext context, String screen) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      screen,
          (route) => false,
    );
  }

  static void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      // Show a message for a specific time when there is no back screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No back screen available!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

}