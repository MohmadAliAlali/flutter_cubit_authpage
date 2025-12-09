// lib/core/widget/floating_cart_fav_bar.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/cart/data/cart_model.dart';
import 'package:task1_cubit/features/cart/prisintation/manager/cart_cubit.dart';
import 'package:task1_cubit/features/favourites/prisintation/manager/favourites_cubit.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

class FloatingCartFavBar extends StatelessWidget {
  final ProductInfoModel product;
  const FloatingCartFavBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final favCubit = context.read<FavouriteCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(28.r),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.2.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 12,
                  spreadRadius: -2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Favourite
                _glassIconButton(
                  icon: Icons.favorite,
                  color: favCubit.isFav(product) ? Colors.redAccent : Colors.white70,
                  onTap: () => favCubit.toggle(product),
                ),
                // Cart controls
                BlocBuilder<CartCubit, List<CartItem>>(
                  builder: (_, items) {
                    final item = items.firstWhere(
                      (i) => i.product == product,
                      orElse: () => CartItem(product, 0),
                    );
                    return Row(
                      children: [
                        _glassIconButton(
                          icon: Icons.remove,
                          onTap: () => cartCubit.decrement(item),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          item.quantity.toString(),
                          style: TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                        SizedBox(width: 12.w),
                        _glassIconButton(
                          icon: Icons.add,
                          onTap: () {
                            cartCubit.increment(item);
                            if (cartCubit.shouldWarn(item)) {
                              _showGlassWarning(context);
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
                // Total price
                BlocBuilder<CartCubit, List<CartItem>>(
                  builder: (_, items) {
                    final item = items.firstWhere(
                      (i) => i.product == product,
                      orElse: () => CartItem(product, 0),
                    );
                    return Text(
                      "${item.total.toStringAsFixed(2)} \$",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _glassIconButton({
    required IconData icon,
    Color? color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.2.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Icon(icon, size: 20.sp, color: color ?? Colors.white),
        ),
      ),
    );
  }

  void _showGlassWarning(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (_) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: AlertDialog(
            backgroundColor: Colors.white.withOpacity(0.08),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
              side: BorderSide(color: Colors.white.withOpacity(0.2), width: 1.2),
            ),
            title: Text("Price Rule", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            content: Text(
              "Items after the first 3 will be calculated at the normal price.",
              style: TextStyle(color: Colors.white70, fontSize: 14.sp),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Got it", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              ),
            ],
          ),
        ),
      );
    });
  }
}