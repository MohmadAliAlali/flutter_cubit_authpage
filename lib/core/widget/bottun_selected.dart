import 'package:flutter/material.dart';
import 'package:task1_cubit/core/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';


class ButtonSelected extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final double? borderRadius;
  final TextStyle? textStyle;
  final double? height;
  final double? width;

  const ButtonSelected({
    super.key,
    required this.child,
    required this.onPressed,
    this.color,
    this.borderRadius,
    this.textStyle,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius?.r ?? 14.r;

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedScale(
        scale: onPressed == null ? 1.0 : 0.96,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutBack,
        child: AnimatedOpacity(
          opacity: onPressed == null ? 0.6 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: Container(
            width: width?.w,
            height: height?.h ?? 70.h,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 4.h, 0, 4.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(effectiveRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.w, sigmaY: 4.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(8),
                    borderRadius: BorderRadius.circular(effectiveRadius),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.tertiary.withAlpha(25),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withAlpha(10),
                        blurRadius: 10,
                        spreadRadius: -2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child:child
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
