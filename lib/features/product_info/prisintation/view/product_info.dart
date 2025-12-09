import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';

import 'package:task1_cubit/features/product_info/prisintation/manager/product_info_cubit.dart';
import 'package:task1_cubit/features/product_info/prisintation/manager/product_info_state.dart';
import 'package:task1_cubit/features/product_info/prisintation/view/widget/floating_bar.dart';
import 'package:task1_cubit/features/product_info/prisintation/view/widget/galss_card.dart';
import 'package:task1_cubit/features/product_info/prisintation/view/widget/glow_badg.dart';

class ProductInfoPage extends StatelessWidget {
  const ProductInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductInfoCubit>();

    return BlocProvider.value(
      value: cubit..loadProduct(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: (glassAppBar(cubit.product.title, context)),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: Theme.of(context).brightness == Brightness.dark
                  ? const [Color(0xFF1E1E1E), Color(0xFF121212)]
                  : const [Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
            ),
          ),
          child: BlocBuilder<ProductInfoCubit, ProductInfoState>(
            builder: (context, state) {
              if (state is ProductInfoLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white70),
                );
              }

              if (state is ProductInfoLoaded) {
                final p = state.product;
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      glassCard(
                        context: context,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.asset(
                            p.image,
                            width: double.infinity,
                            height: 250.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      glassCard(
                        context: context,
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.title,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              p.description,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Theme.of(
                                  context,
                                ).colorScheme.tertiary.withAlpha(80),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${p.price.toStringAsFixed(2)} \$",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                                glowBadge(p.category.name, context),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 70.h),
                    ],
                  ),
                );
              }
              if (state is ProductInfoError) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(color: Colors.redAccent, fontSize: 18.sp),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        floatingActionButton: BlocBuilder<ProductInfoCubit, ProductInfoState>(
          builder: (context, state) {
            if (state is! ProductInfoLoaded) return const SizedBox.shrink();
            final p = state.product;
            return SizedBox(
              height: 80.h,
              width: 330.w,
              child:floatinBar(context: context, p: p));
          },
        ),
      ),
    );
  }
}
