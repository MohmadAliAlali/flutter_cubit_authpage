import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/core/color.dart';
import 'package:task1_cubit/core/navigation.dart';
// import 'package:task1_cubit/features/test/presentation/view/manager/user_cubit/user_cubit.dart';
// import 'package:task1_cubit/features/test/presentation/view/user_page.dart';
// import 'package:task1_cubit/server/repo/api_service.dart';

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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => BlocProvider.value(
        //       value: UsersCubit(context.read<ApiService>())..fetchUsers(),
        //       child: const UsersPage(),
        //     ),
        //   ),
        // );
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
