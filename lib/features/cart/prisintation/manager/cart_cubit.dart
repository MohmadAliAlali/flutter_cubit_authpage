// lib/features/cart/presentation/manager/cart_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/cart/data/cart_model.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  void add(ProductInfoModel p) {
    final idx = state.indexWhere((i) => i.product == p);
    if (idx == -1) {
      emit([...state, CartItem(p)]);
    } else {
      final updated = List<CartItem>.from(state);
      updated[idx].quantity++;
      emit(updated);
    }
  }

  void increment(CartItem item) {
    final updated = List<CartItem>.from(state);
    final idx = updated.indexWhere((i) => i.product == item.product);
    updated[idx].quantity++;
    emit(updated);
  }

  void decrement(CartItem item) {
    final updated = List<CartItem>.from(state);
    final idx = updated.indexWhere((i) => i.product == item.product);
    if (updated[idx].quantity > 1) {
      updated[idx].quantity--;
      emit(updated);
    } else {
      remove(item);
    }
  }

  void remove(CartItem item) => emit(state.where((i) => i != item).toList());

  double get grandTotal => state.fold(0, (t, e) => t + e.total);

  bool shouldWarn(CartItem item) => item.quantity == 4; // first exceed
}