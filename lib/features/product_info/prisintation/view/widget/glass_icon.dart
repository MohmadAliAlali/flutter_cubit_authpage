 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget glassIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary.withAlpha(10),
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary.withAlpha(25),
            width: 1.2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary.withAlpha(1),
              blurRadius: 8,
              spreadRadius: -2,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Icon(icon, color: color, size: 24.sp),
        ),
      ),
    );
  }