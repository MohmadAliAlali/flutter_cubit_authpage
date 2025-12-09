import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/style/color.dart';
import 'package:task1_cubit/core/widget/bottun_selected.dart';

class ButtonWithText extends StatelessWidget {
  final String child;
  final VoidCallback? onPressed;
  final Color? color;
  final double? borderRadius;

  const ButtonWithText({
    super.key,
    required this.child,
    required this.onPressed,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonSelected(
      onPressed: onPressed,
      width: double.infinity,
      height: 70.w,
      borderRadius: borderRadius,
      child: Text(
        child,
        style: TextStyle(
          color: color ?? TaskColor.lightGreen,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
