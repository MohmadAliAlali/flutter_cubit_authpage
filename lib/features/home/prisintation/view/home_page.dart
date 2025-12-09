import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/core/widget/glass_button.dart';
import 'package:task1_cubit/features/home/prisintation/manager/home_cubit.dart';
import 'package:task1_cubit/features/home/prisintation/manager/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/product_info/prisintation/view/widget/galss_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadHomeContent(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: glassAppBar('Settings', context),
        body: Stack(
          children: [
            Container(
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
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is HomeLoaded) {
                  return 
               
                      Padding(
                        padding: EdgeInsetsGeometry.fromLTRB(
                          12.w,
                          80.h,
                          12.w,
                          70.h,
                        ),
                        child: Column(
                          children: [
                            glassCard(
                              context: context,
                              child: CarouselSlider.builder(
                                itemCount: state.sliderImages.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    margin: EdgeInsets.all(2.r),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          state.sliderImages[index],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  height: 200.h,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.9,
                                  aspectRatio: 16 / 9,
                                  onPageChanged: (index, reason) {
                                    context
                                        .read<HomeCubit>()
                                        .changeSlideManually(index);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            glassCard(
                              context: context,
                              child: Column(
                                children: [
                                  glassButton(
                                    label: 'Cart',
                                    onTap: () {
                                      Navigation.navigateToScreen(
                                        context,
                                        '/cart',
                                      );
                                    },
                                    context: context,
                                  ),
                                  glassButton(
                                    label: 'Favourites',
                                    onTap: () {
                                      Navigation.navigateToScreen(
                                        context,
                                        '/favourites',
                                      );
                                    },
                                    context: context,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                   
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
