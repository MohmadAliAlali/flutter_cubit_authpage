import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/home/prisintation/view/home_page.dart';
import 'package:task1_cubit/features/navbar/prisintation/manager/navbar_cubit.dart';
import 'package:task1_cubit/features/navbar/prisintation/view/wedgit/navbar_wid.dart';
import 'package:task1_cubit/features/product_list/prisintation/view/list_product.dart';
import 'package:task1_cubit/features/settings/data/prisintation/view/settings_page.dart';

class NavbarScreen extends StatelessWidget {
  NavbarScreen({super.key});

  final List<Widget> _screens = [ListProduct(), HomePage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavbarCubit(),
      child: BlocBuilder<NavbarCubit, int>(
        builder: (context, index) {
          return Scaffold(
            extendBody: true, // ضروري لرؤية المحتوى خلف الأزرار الزجاجية
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              child: _screens[index],
            ),
            bottomNavigationBar: const IOSLiquidNavBar(),
          );
        },
      ),
    );
  }
}
