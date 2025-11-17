// lib/widgets/custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:task1_cubit/core/responsive.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final double width;
  final bool isError;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.width,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isError ? Colors.red : Colors.grey,
              width: 1.3.e,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isError ? Colors.red : Colors.green,
              width: 1.5.e,
            ),
          ),
        ),
      ),
    );
  }
}
