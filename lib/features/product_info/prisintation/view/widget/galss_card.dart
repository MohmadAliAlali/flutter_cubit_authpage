import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget glassCard({required Widget child, EdgeInsets? padding,required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(24.r),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        padding: padding ?? EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary.withAlpha(8),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary.withAlpha(20),
            width: 1.2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary.withAlpha(10),
              blurRadius: 12,
              spreadRadius: -2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: child,
      ),
    ),
  );
}
