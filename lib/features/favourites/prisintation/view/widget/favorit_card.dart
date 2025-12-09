import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/favourites/prisintation/manager/favourites_cubit.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

Widget glassFavCard(ProductInfoModel p, BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(24.r),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(8),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: Colors.white.withAlpha(20),
            width: 1.2.w,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                p.image,
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
                    p.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "${p.discountedPrice?.toStringAsFixed(2)} \$",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.redAccent),
              onPressed: () =>
                  BlocProvider.of<FavouriteCubit>(context).toggle(p),
            ),
          ],
        ),
      ),
    ),
  );
}
