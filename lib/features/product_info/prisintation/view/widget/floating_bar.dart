import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/core/widget/glass_button.dart';
import 'package:task1_cubit/features/cart/prisintation/manager/cart_cubit.dart';
import 'package:task1_cubit/features/favourites/data/favourites_model.dart';
import 'package:task1_cubit/features/favourites/prisintation/manager/favourites_cubit.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';
import 'package:task1_cubit/features/product_info/prisintation/view/widget/glass_icon.dart';

Widget floatinBar({required ProductInfoModel p, required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      BlocBuilder<FavouriteCubit, FavouriteModel>(
        builder: (_, fav) {
          final isFav = fav.isFav(p);
          return glassIconButton(
            context: context,
            icon: isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav
                ? Colors.redAccent
                : Theme.of(context).colorScheme.tertiary,
            onTap: () => BlocProvider.of<FavouriteCubit>(context).toggle(p),
          );
        },
      ),
      // زر الإضافة إلى السلة
      Expanded(
        child: glassButton(
          label: "Add to Cart",
          onTap: () {
            BlocProvider.of<CartCubit>(context).add(p);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${p.title} added to cart"),
                backgroundColor: Theme.of(context).colorScheme.primary,
                duration: const Duration(seconds: 1),
              ),
            );
          },
          context: context,
        ),
      ),
    ],
  );
}
