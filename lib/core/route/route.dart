import 'package:flutter/material.dart';
import 'package:task1_cubit/features/home/prisintation/view/home_page.dart';
import 'package:task1_cubit/features/login/prisintation/view/login_page.dart';
import 'package:task1_cubit/features/navbar/prisintation/view/navbar_page.dart';
import 'package:task1_cubit/features/profile/prisintation/view/profile_page.dart';
import 'package:task1_cubit/features/register/prisintation/view/resgister_page.dart';
import 'package:task1_cubit/features/reset_paswword/prisintation/view/rest_password_page.dart';
import 'package:task1_cubit/features/settings/data/prisintation/view/settings_page.dart';
import 'package:task1_cubit/features/splash_page/splash_page.dart';
import 'package:task1_cubit/features/test/presentation/view/user_page.dart';
import 'package:task1_cubit/features/virfi_page/prisintation/view/virfi_page.dart';

abstract final class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String virfi = '/virfi';
  static const String user = '/user';
  static const String reestPassword = '/rePass';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String navBar = '/navbar';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashPage(),
    login: (_) => LoginPage(),
    register: (_) => RegisterPage(),
    virfi: (_) => VirfiPage(),
    reestPassword: (_) => RestPasswordPage(),
    user: (_) => UsersPage(),
    home: (_) => const HomePage(),
    profile: (_) =>  ProfilePage(),
    settings: (_) => const SettingsPage(),
    navBar : (_) => NavbarScreen(),
  };
}
