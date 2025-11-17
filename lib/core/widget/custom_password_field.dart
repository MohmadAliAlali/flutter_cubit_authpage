import 'package:flutter/material.dart';
import 'package:task1_cubit/core/responsive.dart';

class CustomPasswordField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final double? height;
  final double? width;
  final bool isError;

  const CustomPasswordField({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.onChanged,
    this.height,
    this.width,
    this.isError = false,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 260.w,
      child: Row(
        children: [
          // TextField نفسه
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: _obscure,
              decoration: InputDecoration(
                labelText: widget.labelText,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isError ? Colors.red : Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isError ? Colors.red : Colors.green,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(width: 6.w),

          // زر الإخفاء والإظهار
          Container(
            width: widget.height ?? 58.w,
            height: widget.height ?? 58.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: widget.isError ? Colors.red : Colors.grey,
              ),
            ),
            child: IconButton(
              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
