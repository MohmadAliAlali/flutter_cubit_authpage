
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/features/cart/prisintation/view/widget/empty_cart.dart';
import 'package:task1_cubit/features/favourites/data/favourites_model.dart';
import 'package:task1_cubit/features/favourites/prisintation/manager/favourites_cubit.dart';
import 'package:task1_cubit/features/favourites/prisintation/view/widget/favorit_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: glassAppBar('Favourites', context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: Theme.of(context).brightness == Brightness.dark
                ? const [Color(0xFF1E1E1E), Color(0xFF121212)]
                : const [Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
          ),
        ),
        child: BlocBuilder<FavouriteCubit, FavouriteModel>(
          builder: (_, fav) {
            if (fav.items.isEmpty) return const EmptyCart(title: "No favourites yet");
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
              itemCount: fav.items.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (_, i) => glassFavCard(fav.items[i],context),
            );
          },
        ),
      ),
    );
  }


}
