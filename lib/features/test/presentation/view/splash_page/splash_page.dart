import 'package:flutter/material.dart';
import 'package:task1_cubit/core/color.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/features/test/presentation/view/login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigation.navigateAndRemove(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TaskColor.grey, // splash colour
      body: Center(
        child: FlutterLogo(size: 120), // or any widget
      ),
    );
  }
}
