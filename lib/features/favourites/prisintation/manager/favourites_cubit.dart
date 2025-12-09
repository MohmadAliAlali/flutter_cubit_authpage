// lib/features/favourite/presentation/manager/favourite_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/favourites/data/favourites_model.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

class FavouriteCubit extends Cubit<FavouriteModel> {
  FavouriteCubit() : super(FavouriteModel());

  void toggle(ProductInfoModel p) {
    final exists = state.items.contains(p);
    emit(FavouriteModel(
      exists
          ? state.items.where((i) => i != p).toList()
          : [...state.items, p],
    ));
  }

  bool isFav(ProductInfoModel p) => state.items.contains(p);
}