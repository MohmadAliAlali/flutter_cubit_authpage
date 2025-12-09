import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/cart/data/cart_model.dart';
import 'package:task1_cubit/features/cart/prisintation/manager/cart_cubit.dart';

Widget glassTotalBar(BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24.r),
      topRight: Radius.circular(24.r),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20.w, sigmaY: 20.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary.withAlpha(10),
          border: Border(
            top: BorderSide(color: Theme.of(context).colorScheme.tertiary.withAlpha(20), width: 1.2.w),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(fontSize: 18.sp, color: Theme.of(context).colorScheme.tertiary),
            ),
            BlocBuilder<CartCubit, List<CartItem>>(
              builder: (_, items) => Text(
                "${BlocProvider.of<CartCubit>(context).grandTotal.toStringAsFixed(2)} \$",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
