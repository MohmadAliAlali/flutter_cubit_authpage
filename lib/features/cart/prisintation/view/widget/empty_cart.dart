import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCart extends StatelessWidget {
  final String title;
  const EmptyCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          color: Theme.of(context).colorScheme.tertiary.withAlpha(7),
        ),
      ),
    );
  }
}
