import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSize glassAppBar(String title, BuildContext context) {
  final canPop = Navigator.of(context).canPop();

  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.w, sigmaY: 8.h),
          child: AppBar(
            automaticallyImplyLeading: false, // نتحكم نحن
            backgroundColor: Theme.of(
              context,
            ).colorScheme.tertiary.withAlpha(8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
              side: BorderSide(
                color: Theme.of(context).colorScheme.tertiary.withAlpha(50),
                width: 1.6.w,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            leading: canPop
                ? Padding(
                    padding: EdgeInsets.only(left: 8.w, top: 4.h, bottom: 4.h),
                    child: _glassBackButton(context),
                  )
                : null,
          ),
        ),
      ),
    ),
  );
}

/* زرّ عودة دائري زجاجي صغير */
Widget _glassBackButton(BuildContext context) {
  return InkWell(
    onTap: () => Navigator.of(context).maybePop(),
    borderRadius: BorderRadius.circular(20.r),
    child: Ink(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.2.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 18.sp,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    ),
  );
}
