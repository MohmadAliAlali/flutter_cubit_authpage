class ProductInfoModel {
  final String title;
  final String image;
  final String description;
  final Enum category;
  final double price;
  final double? discountedPrice;

  ProductInfoModel({
    required this.title,
    required this.image,
    required this.description,
    required this.category,
    required this.price,
    this.discountedPrice,
  });

  double get actualDiscountedPrice => discountedPrice ?? price * 0.5;
}