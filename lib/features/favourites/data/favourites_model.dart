// lib/features/favourite/domain/favourite_model.dart
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

class FavouriteModel {
  final List<ProductInfoModel> items;
  FavouriteModel([this.items = const []]);

  bool isFav(ProductInfoModel p) => items.contains(p);
}