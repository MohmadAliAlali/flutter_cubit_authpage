import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget roundIcon(IconData icon, VoidCallback onTap, BuildContext context) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20.r),
    child: Container(
      width: 32.w,
      height: 32.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary.withAlpha(15),
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).colorScheme.tertiary.withAlpha(25), width: 1.w),
      ),
      child: Icon(icon, size: 16.sp, color: Theme.of(context).colorScheme.tertiary),
    ),
  );
}
