import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/core/widget/glass_button.dart';
import 'package:task1_cubit/features/settings/data/prisintation/view/widget/language.dart';
import 'package:task1_cubit/features/settings/data/prisintation/view/widget/them_mode.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: glassAppBar('Settings', context),
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

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(8),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.tertiary.withAlpha(30),
                    width: 1.6,
                  ),
                ),
                child: 
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        SizedBox(height: 16.h),
                        ThemMode(),
                        Language(),
                        glassButton(
                          label: 'About Us',
                          onTap: () {},
                          context: context,
                        ),
                        glassButton(
                          label: 'Upgrade Acount',
                          onTap: () {},
                          context: context,
                        ),
                        glassButton(
                          label: 'Create Acount',
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          context: context,
                        ),
                        glassButton(
                          label: 'Veiw Profile',
                          onTap: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          context: context,
                        ),
                        glassButton(
                          label: 'Cart',
                          onTap: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          
          ),
        ),
      ),
    );
  }
}
