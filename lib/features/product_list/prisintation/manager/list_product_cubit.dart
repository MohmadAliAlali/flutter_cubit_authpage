import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

part 'list_product_state.dart';

enum Filter { none, priceRange, category }

enum Category { all, pizza, burger, pasta, chicken, tacos }

class ListCubit extends Cubit<ListProductState> {
  ListCubit() : super(ListInitial());

  Filter _currentFilter = Filter.none;
  Category _selectedCategory = Category.all;
  double _minPrice = 0;
  double _maxPrice = 100; // قيمة افتراضية عالية
  List<ProductInfoModel> _original = [];

  /* getters للواجهة */
  Filter get currentFilter => _currentFilter;
  Category get selectedCategory => _selectedCategory;
  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;
  double get actualMin =>
      _original.map((p) => p.price).fold(9999, (a, b) => a < b ? a : b);
  double get actualMax =>
      _original.map((p) => p.price).fold(0, (a, b) => a > b ? a : b);
  Future<void> loadListContent() async {
    try {
      emit(ListLoading());
      await Future.delayed(const Duration(milliseconds: 900));

      _original = [
        ProductInfoModel(
          title: "Pizza Margherita",
          price: 12.99,
          image: "assets/mock_data/profile.png",
          description:
              "Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza",
          category: Category.pizza,
        ),
        ProductInfoModel(
          title: "Cheese Burger",
          price: 9.50,
          image: "assets/mock_data/profile.png",
          description: "Beef burger Classic Italian pizza Beef burger Classic Italian pizza Beef burger Classic Italian pizza Beef burger Classic Italian pizza Beef burger Classic Italian pizzaBeef burger Classic Italian pizza",
          category: Category.burger,
        ),
        ProductInfoModel(
          title: "Creamy Pasta",
          price: 14.25,
          image: "assets/mock_data/profile.png",
          description: "Creamy Alfredo pastaCreamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo paslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pasta",
          category: Category.pasta,
        ),
        ProductInfoModel(
          title: "Fried Chicken",
          price: 11.75,
          image: "assets/mock_data/profile.png",
          description: "Crispy fried chicken Soft tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pas tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasttacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo past",
          category: Category.chicken,
        ),
        ProductInfoModel(
          title: "Mexican Tacos",
          price: 10.00,
          image: "assets/mock_data/profile.png",
          description: "Soft tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pas Soft tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pas",
          category: Category.tacos,
        ),
                ProductInfoModel(
          title: "Pizza Margherita",
          price: 12.99,
          image: "assets/mock_data/profile.png",
          description:
              "Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza",
          category: Category.pizza,
        ),
        ProductInfoModel(
          title: "Cheese Burger",
          price: 9.50,
          image: "assets/mock_data/profile.png",
          description: "Beef burger Classic Italian pizza Beef burger Classic Italian pizza Beef burger Classic Italian pizza Beef burger Classic Italian pizza Beef burger Classic Italian pizzaBeef burger Classic Italian pizza",
          category: Category.burger,
        ),
        ProductInfoModel(
          title: "Creamy Pasta",
          price: 14.25,
          image: "assets/mock_data/profile.png",
          description: "Creamy Alfredo pastaCreamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo paslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pasta",
          category: Category.pasta,
        ),
        ProductInfoModel(
          title: "Fried Chicken",
          price: 11.75,
          image: "assets/mock_data/profile.png",
          description: "Crispy fried chicken Soft tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pas tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasttacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo past",
          category: Category.chicken,
        ),
        ProductInfoModel(
          title: "Mexican Tacos",
          price: 10.00,
          image: "assets/mock_data/profile.png",
          description: "Soft tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pas Soft tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pas",
          category: Category.tacos,
        ),
                ProductInfoModel(
          title: "Pizza Margherita",
          price: 12.99,
          image: "assets/mock_data/profile.png",
          description:
              "Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza Classic Italian pizza",
          category: Category.pizza,
        ),
        ProductInfoModel(
          title: "Cheese Burger",
          price: 9.50,
          image: "assets/mock_data/profile.png",
          description: "Beef burger Classic Italian pizza Beef burger Classic Italian pizza Beef burger Classic Italian pizza Beef burger Classic Italian pizza Beef burger Classic Italian pizzaBeef burger Classic Italian pizza",
          category: Category.burger,
        ),
        ProductInfoModel(
          title: "Creamy Pasta",
          price: 14.25,
          image: "assets/mock_data/profile.png",
          description: "Creamy Alfredo pastaCreamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo paslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pasta",
          category: Category.pasta,
        ),
        ProductInfoModel(
          title: "Fried Chicken",
          price: 11.75,
          image: "assets/mock_data/profile.png",
          description: "Crispy fried chicken Soft tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pas tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasttacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo past",
          category: Category.chicken,
        ),
        ProductInfoModel(
          title: "Mexican Tacos",
          price: 10.00,
          image: "assets/mock_data/profile.png",
          description: "Soft tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pas Soft tacoslfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pasta Creamy Alfredo pastaCreamy Alfredo pas",
          category: Category.tacos,
        ),
      ];

      _applyFilter(); // أول عرض
    } catch (e) {
      emit(ListError("Something went wrong"));
    }
  }

  /* تغيير نطاق السعر */
  void setPriceRange(double min, double max) {
    _currentFilter = Filter.priceRange;
    _minPrice = min;
    _maxPrice = max;
    _applyFilter();
  }

  /* اختيار الفئة */
  void setCategory(Category c) {
    _currentFilter = Filter.category;
    _selectedCategory = c;
    _applyFilter();
  }

  /* إلغاء أي فلتر */
  void clearFilter() {
    _currentFilter = Filter.none;
    _selectedCategory = Category.all;
    _minPrice = 0;
    _maxPrice = 100;
    _applyFilter();
  }

  /* التطبيق الفعلي */
  void _applyFilter() {
    var filtered = List.of(_original);

    /* فلترة الفئة */
    if (_selectedCategory != Category.all) {
      filtered = filtered
          .where((p) => p.category == _selectedCategory)
          .toList();
    }

    /* فلترة النطاق السعري */
    if (_currentFilter == Filter.priceRange) {
      filtered = filtered
          .where((p) => p.price >= _minPrice && p.price <= _maxPrice)
          .toList();
    }

    emit(ListLoaded(products: filtered));
  }
}
