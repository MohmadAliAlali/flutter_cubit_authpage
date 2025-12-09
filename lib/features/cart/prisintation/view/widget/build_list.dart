import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/cart/data/cart_model.dart';
import 'package:task1_cubit/features/cart/prisintation/manager/cart_cubit.dart';
import 'package:task1_cubit/features/cart/prisintation/view/widget/cart_item.dart';
import 'package:task1_cubit/features/cart/prisintation/view/widget/empty_cart.dart'; 
 
  Widget buildList(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItem>>(
      builder: (_, items) {
        if (items.isEmpty) return const EmptyCart(title: "Your cart is empty");
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 60.h),
          itemCount: items.length,
          separatorBuilder: (_, __) => SizedBox(height: 8.h),
          itemBuilder: (_, i) => glassCartCard(items[i], context),
        );
      },
    );
  }
