// lib/features/cart/presentation/view/cart_page.dart
import 'package:flutter/material.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/features/cart/prisintation/view/widget/build_list.dart';
import 'package:task1_cubit/features/cart/prisintation/view/widget/glass_total_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: glassAppBar('My Cart', context),
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
        child: Column(
          children: [
            Expanded(child: buildList(context)),
            glassTotalBar(context),
          ],
        ),
      ),
    );
  }
}
