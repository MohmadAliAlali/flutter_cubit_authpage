import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/features/product_list/prisintation/manager/list_product_cubit.dart';
import 'package:task1_cubit/features/product_list/prisintation/view/widget.dart/filter_panel.dart';
import 'package:task1_cubit/features/product_list/prisintation/view/widget.dart/list.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListCubit()..loadListContent(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: glassAppBar('Products', context),
        body: Stack(
          children: [
            Container(
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
            ),
            Padding(
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
                        color: Theme.of(
                          context,
                        ).colorScheme.tertiary.withAlpha(30),
                        width: 1.6,
                      ),
                    ),
                    child: buildList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) {
            final cubit = context.read<ListCubit>();
            return Padding(
              padding: EdgeInsetsGeometry.only(bottom: 55.h, right: 12.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.w, sigmaY: 4.h),
                  child: FloatingActionButton(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withAlpha(60),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(360),
                    ),
                    onPressed: () =>
                        _showFilterOverlay(context, cubit), // ✅ نمرّره
                    child: const Icon(Icons.filter_list, size: 28),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showFilterOverlay(BuildContext ctx, ListCubit cubit) {
    final overlay = Overlay.of(ctx);
    late OverlayEntry entry;
    bool removed = false; // علم

    entry = OverlayEntry(
      builder: (_) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (!removed) {
            removed = true;
            entry.remove();
          }
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
            child: FilterPanel(
              cubit: cubit,
              onClose: () {
                if (!removed) {
                  removed = true;
                  entry.remove();
                }
              },
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
  }
}
