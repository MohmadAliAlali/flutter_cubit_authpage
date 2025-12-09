import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/navbar/prisintation/manager/navbar_cubit.dart';
import 'package:task1_cubit/features/navbar/prisintation/view/wedgit/nav_item.dart';

class IOSLiquidNavBar extends StatelessWidget {
  const IOSLiquidNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final current = context.watch<NavbarCubit>().state;

    return SafeArea(
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 5), // مسافة من الأسفل
        child: Container(
          height: 60.h,
          color: Colors
              .transparent, // جعل الحاوية الكبيرة شفافة تماماً وبدون تأثيرات
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // توزيع متساوي
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavItem(icon: Icons.person, index: 0, selectedIndex: current),
              NavItem(icon: Icons.home, index: 1, selectedIndex: current),
              NavItem(icon: Icons.settings, index: 2, selectedIndex: current),
            ],
          ),
        ),
      ),
    );
  }
}
