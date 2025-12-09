import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/settings/data/prisintation/manager/settings_cubit.dart';
import 'package:task1_cubit/features/settings/data/prisintation/view/widget/button_with_icon.dart';

class ThemMode extends StatelessWidget {
  const ThemMode({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SettingsCubit>();
    final icons = const [
      Icons.light_mode,
      Icons.dark_mode,
      Icons.settings_suggest,
    ];
    final modes = const [ThemeMode.light, ThemeMode.dark, ThemeMode.system];
    final selectedIndex = modes.indexOf(cubit.themeMode);
    return Padding(
      padding: EdgeInsets.fromLTRB(6.w, 5.h, 0, 5.h),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          GlassSegmentedControl(
            type: true,
            icons: icons,
            minWidth: 55.w,
            selectedIndex: selectedIndex,
            onIndexChanged: (i) => cubit.changeMode(mode: modes[i]),
          ),
        ],
      ),
    );
  }
}
