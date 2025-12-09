import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/widget/Info_continer.dart';
import 'package:task1_cubit/features/register/data/local/user_local_storage.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final UserLocalStorage storage = UserLocalStorage();
  @override
  Widget build(BuildContext context) {
    Color on = Theme.of(context).colorScheme.primary;
    Color off = Theme.of(context).colorScheme.tertiary;
    final user = storage.getUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Center(
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/mock_data/profile.png"),
                ),
              ),
            ),
            Spacer(),
            SizedBox(height: 10.h),
            InfoContiner(
              title: 'name',
              info: '${user?['name']} ${user?['lastName']}',
              width1: 100.w,
              width2: 223,
              color: on,
              textStyle: TextStyle(color: off),
            ),
            SizedBox(height: 10.h),
            InfoContiner(
              title: 'Bearth Day ',
              info: '27/7/2003',
              width1: 150.w,
              width2: 172,
              color: on,
              textStyle: TextStyle(color: off),
            ),
            SizedBox(height: 10.h),
            InfoContiner(
              title: 'Localtion',
              info: 'Damascus Syria',
              width1: 100.w,
              width2: 223,
              color: on,
              textStyle: TextStyle(color: off),
            ),
            SizedBox(height: 10.h),
            InfoContiner(
              title: 'Email',
              info: user?['email'],
              width1: 100.w,
              width2: 223,
              color: on,
              textStyle: TextStyle(color: off),
            ),
          ],
        ),
      ),
    );
  }
}
