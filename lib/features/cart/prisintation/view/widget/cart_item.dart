import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/cart/data/cart_model.dart';
import 'package:task1_cubit/features/cart/prisintation/manager/cart_cubit.dart';
import 'package:task1_cubit/features/cart/prisintation/view/widget/round_icon.dart';

Widget glassCartCard(CartItem item, BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16.r),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary.withAlpha(8),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: Theme.of(context).colorScheme.tertiary.withAlpha(2), width: 1.2.w),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                item.product.image,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "${item.total.toStringAsFixed(2)} \$",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (item.quantity > 3)
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        "Extra items at normal price",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              children: [
                roundIcon(
                  Icons.add,
                  () => BlocProvider.of<CartCubit>(context).increment(item),
                  context,
                ),
                SizedBox(height: 8.h),
                Text(
                  item.quantity.toString(),
                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(height: 8.h),
                roundIcon(
                  
                  Icons.remove,
                  () => BlocProvider.of<CartCubit>(context).decrement(item),
                  context,
                ),
              ],
            ),
            SizedBox(width: 8.w),
            IconButton(
              icon:  Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.tertiary),
              onPressed: () => BlocProvider.of<CartCubit>(context).remove(item),
            ),
          ],
        ),
      ),
    ),
  );
}
