import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/product_list/prisintation/manager/list_product_cubit.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPanel extends StatelessWidget {
  final VoidCallback onClose;
  final ListCubit cubit;
  const FilterPanel({super.key, required this.onClose, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final actualMin = cubit.actualMin; // أصغر سعر
    final actualMax = cubit.actualMax; // أكبر سعر
    final safeStart = cubit.minPrice.clamp(actualMin, actualMax);
    final safeEnd = cubit.maxPrice.clamp(actualMin, actualMax);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 100.h),
        child: Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: scheme.brightness == Brightness.dark
                      ? Colors.white.withOpacity(0.08)
                      : Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: scheme.tertiary.withOpacity(0.25),
                    width: 1.2.w,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8.h),
                    Text(
                      'Price range',
                      style: TextStyle(
                        color: scheme.tertiary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    RangeSlider(
                      values: RangeValues(safeStart, safeEnd),
                      min: actualMin,
                      max: actualMax,
                      divisions: (actualMax - actualMin).round(),
                      labels: RangeLabels(
                        safeStart.toStringAsFixed(1),
                        safeEnd.toStringAsFixed(1),
                      ),
                      onChanged: (rng) async {
                        cubit.setPriceRange(rng.start, rng.end);
                        await Future.delayed(const Duration(milliseconds: 300));
                        onClose();
                      },
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: scheme.tertiary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: Category.values
                          .map(
                            (c) => ChoiceChip(
                              label: Text(c.name),
                              selected:
                                  cubit.selectedCategory == c, // ✅ من المعامل
                              onSelected: (_) async {
                                cubit.setCategory(c);
                                await Future.delayed(
                                  const Duration(milliseconds: 300),
                                );
                                onClose();
                              },
                              selectedColor: Theme.of(
                                context,
                              ).primaryColor.withOpacity(0.25),
                              labelStyle: TextStyle(
                                color: cubit.selectedCategory == c
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.tertiary,
                              ),
                              backgroundColor: Colors.transparent,
                              side: BorderSide(
                                color: Theme.of(
                                  context,
                                ).colorScheme.tertiary.withOpacity(0.3),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 12.h),
                    TextButton(
                      onPressed: cubit.clearFilter,
                      child: Text(
                        'Clear filters',
                        style: TextStyle(color: scheme.primary),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 28,
                        color: Colors.white,
                      ),
                      color: scheme.tertiary,
                      onPressed: onClose,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
