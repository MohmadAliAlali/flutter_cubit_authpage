import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GlassSegmentedControl extends StatelessWidget {
  final List icons;
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  final double height;
  final double minWidth;
  final double maxWidth;
  final double borderRadius;
  final bool type;

  const GlassSegmentedControl({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onIndexChanged,
    this.height = 60,
    this.minWidth = 62,
    this.maxWidth = 80,
    this.borderRadius = 14,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius.r;

    return ClipRRect(
      borderRadius: BorderRadius.circular(effectiveRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.w, sigmaY: 4.h),
        child: Container(
          height: height.h,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary.withAlpha(25),
              width: 1.6,
            ),
            borderRadius: BorderRadius.circular(effectiveRadius),
          ),
          child: Row(
            spacing: minWidth,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              final selected = index == selectedIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                width: selected ? maxWidth.w : minWidth.w,
                alignment: Alignment.center,
                child: AnimatedScale(
                  scale: selected ? 1.05 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(effectiveRadius),
                      focusColor: Theme.of(context).colorScheme.tertiary,
                      onTap: () => onIndexChanged(index),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child:type? Icon(
                          icons[index],
                          color: selected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.tertiary,
                          size: 24,
                        ): Text(
                          icons[index],
                          style: TextStyle(
                            color: selected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.tertiary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                      ),
                    ),
                  ),
                ),
                )
              );
            }),
          ),
        ),
      ),
    );
  }
}
