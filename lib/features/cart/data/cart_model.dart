// lib/features/cart/domain/cart_item.dart
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

class CartItem {
  final ProductInfoModel product;
  int quantity;

  CartItem(this.product, [this.quantity = 1]);

  double get total {
    const int discountThreshold = 3;
    final discountQty = quantity.clamp(0, discountThreshold);
    final normalQty = (quantity - discountThreshold).clamp(0, quantity);
    return (discountQty * product.actualDiscountedPrice) +
           (normalQty * product.price);
  }
}

