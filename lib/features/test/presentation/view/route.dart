import 'package:flutter/material.dart';
import 'package:task1_cubit/features/test/presentation/view/login/login_page.dart';
import 'package:task1_cubit/features/test/presentation/view/register/resgister_page.dart';
import 'package:task1_cubit/features/test/presentation/view/reset_paswword/rest_password_page.dart';
import 'package:task1_cubit/features/test/presentation/view/splash_page/splash_page.dart';
import 'package:task1_cubit/features/test/presentation/view/virfi_page/virfi_page.dart';

abstract final class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String virfi = '/virfi';
  static const String reestPassword = '/rePass';
  static const String home = '/home';
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashPage(),
    login: (_) => LoginPage(),
    register: (_) => RegisterPage(),
    virfi: (_) => VirfiPage(),
    reestPassword: (_) => RestPasswordPage(),
    // home: (_) => const HomePage(),
    // profile: (_) => const ProfilePage(),
  };
}
