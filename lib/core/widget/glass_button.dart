import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget glassButton({
  required String label,
  required VoidCallback onTap,
  required BuildContext context,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16.r),

    child:BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.w, sigmaY: 4.h),
      child:InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16.r),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withAlpha(7),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary.withAlpha(25),
          width: 1.2.w,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).appBarTheme.foregroundColor,
            ),
          ),
        ),
      ),
    ),
  )));
}
