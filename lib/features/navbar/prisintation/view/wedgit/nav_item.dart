import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/navbar/prisintation/manager/navbar_cubit.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final int selectedIndex;

  const NavItem({super.key, 
    required this.icon,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    final borderRadius = BorderRadius.circular(35.r);
    return GestureDetector(
      onTap: () => context.read<NavbarCubit>().changeTab(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutBack,
        width: isSelected ? 160.w : 60.w,
        height: 60.w,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.w, sigmaY: 4.h),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Theme.of(context).colorScheme.tertiary.withAlpha(
                 isSelected ? 4 : 1,
                ),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.tertiary.withAlpha(40),
                  width: 1.2,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.white.withAlpha(15),
                          blurRadius: 12,
                          spreadRadius: -2,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                size: 28,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
