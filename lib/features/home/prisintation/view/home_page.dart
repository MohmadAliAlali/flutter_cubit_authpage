import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/core/widget/list_view_iem.dart';
import 'package:task1_cubit/features/home/prisintation/manager/home_cubit.dart';
import 'package:task1_cubit/features/home/prisintation/manager/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadHomeContent(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeLoaded) {
              return Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: state.sliderImages.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(state.sliderImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 16 / 9,
                      onPageChanged: (index, reason) {
                        context.read<HomeCubit>().changeSlideManually(index);
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(10.w),
                      child: ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return ListViewIem(
                            title: Image.asset('assets/mock_data/profile.png'),
                            info: state.items[index],
                            width2: 250.w,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
