// lib/core/widget/glass_dialog.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showGlassDialog({
  required BuildContext context,
  required String title,
  required String body,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
      child: AlertDialog(
        backgroundColor: Colors.white.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
          side: BorderSide(color: Colors.white.withOpacity(0.2), width: 1.2),
        ),
        title: Text(title, style: TextStyle(color: Colors.white, fontSize: 18.sp)),
        content: Text(body, style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Got it', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          ),
        ],
      ),
    ),
  );
}