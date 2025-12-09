import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/style/color.dart';

Widget glassCard({
  required String titleText,
  required double price,
  required String descreption,
  required BuildContext context,
}) {
  final scheme = Theme.of(context).colorScheme;

  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.w, sigmaY: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: scheme.brightness == Brightness.dark
              ? Colors.white.withAlpha(20)
              : Colors.black.withAlpha(10),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: scheme.tertiary.withAlpha(25), width: 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.h),
        margin: EdgeInsets.only(bottom: 3.h),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/mock_data/profile.png',
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(
                      color: scheme.brightness == Brightness.dark
                          ? Colors.white
                          : scheme.tertiary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),

                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    descreption,
                    style: TextStyle(
                      color: scheme.brightness == Brightness.dark
                          ? Colors.white
                          : scheme.tertiary,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Text(
              '$price \$',
              style: TextStyle(
                color: TaskColor.lightGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
