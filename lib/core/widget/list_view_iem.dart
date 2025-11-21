import 'package:flutter/material.dart';
import 'package:task1_cubit/core/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewIem extends StatelessWidget {
  final String info;
  final Widget title;
  final Color? color;
  final double? borderRadius;
  final TextStyle? textStyle;
  final double? height;
  final double? width1;
  final double? width2;

  const ListViewIem({
    super.key,
    required this.title,
    required this.info,
    this.color,
    this.borderRadius,
    this.textStyle,
    this.height,
    this.width1,
    this.width2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width1?.w,
          padding: EdgeInsets.all(4.w),
          height: height?.h ?? 60.h,
          decoration: BoxDecoration(
            border: Border.all(color: color ?? TaskColor.lightGreen, width: 2),
            borderRadius: BorderRadius.circular(borderRadius?.r ?? 10.r),
          ),
          child: Center(child: title),
        ),
        Container(
          width: width2?.w,
          margin: EdgeInsets.all(8.w),
          padding: EdgeInsets.all(8.w),
          height: height?.h ?? 60.h,
          decoration: BoxDecoration(
            border: Border.all(color: color ?? TaskColor.lightGreen, width: 2),
            borderRadius: BorderRadius.circular(borderRadius?.r ?? 10.r),
          ),
          child: Center(
            child: Text(
              info,
              style:
                  textStyle ??
                  TextStyle(
                    color: color ?? TaskColor.lightGreen,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
