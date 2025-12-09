import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/settings/data/prisintation/manager/settings_cubit.dart';
import 'package:task1_cubit/features/settings/data/prisintation/view/widget/button_with_icon.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SettingsCubit>();
    final text = const ['Arabic', 'English'];
    final modes = const ["arabic", "english"];

    final selectedIndex = modes.indexOf(cubit.themeLanguag);

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlassSegmentedControl(
              minWidth: 110.w,
              icons: text,
              type: false,
              selectedIndex: selectedIndex,
              onIndexChanged: (i) {
                cubit.changeLanguage(lan: modes[i]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
