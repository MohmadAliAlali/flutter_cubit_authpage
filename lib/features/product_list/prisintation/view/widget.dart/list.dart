import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/product_info/prisintation/manager/product_info_cubit.dart';
import 'package:task1_cubit/features/product_info/prisintation/view/product_info.dart';
import 'package:task1_cubit/features/product_list/prisintation/manager/list_product_cubit.dart';
import 'package:task1_cubit/features/product_list/prisintation/view/widget.dart/card.dart';

Widget buildList() {
  return BlocBuilder<ListCubit, ListProductState>(
    builder: (context, state) {
      if (state is ListLoading) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white70),
        );
      }
      if (state is ListLoaded) {
        return ListView.separated(
          padding:  EdgeInsets.only(
            left: 5,
            right: 5,
            top: 64.h, // ✅ مسافة إضافية أعلى أول عنصر
            bottom: 100.h, // ✅ مسافة إضافية أسفل آخر عنصر
          ),
          itemCount: state.products.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final product = state.products[index];
            return BlocProvider(
              create: (_) => ProductInfoCubit(),
              child: Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      final infoCubit = ProductInfoCubit()..setProduct(product);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: infoCubit,
                            child: const ProductInfoPage(),
                          ),
                        ),
                      );
                    },
                    child: glassCard(
                      descreption: product.description,
                      price: product.price,
                      titleText: product.title,
                      context: context,
                    ),
                  );
                },
              ),
            );
          },
        );
      }

      if (state is ListError) {
        return Center(
          child: Text(
            state.message,
            style: const TextStyle(color: Colors.redAccent),
          ),
        );
      }
      return const SizedBox.shrink();
    },
  );
}
