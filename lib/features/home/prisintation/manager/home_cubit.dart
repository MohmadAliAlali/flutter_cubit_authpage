import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Timer? sliderTimer;

  Future<void> loadHomeContent() async {
    emit(HomeLoading());

    await Future.delayed(const Duration(milliseconds: 900));

    List<String> sliderFakeData = [
      "assets/mock_data/profile.png",
      "assets/mock_data/profile.png",
      "assets/mock_data/profile.png",
    ];

    List<String> listFakeData = [
      "Pizza",
      "Burger",
      "Pasta",
      "Chicken",
      "Tacos",
      "Pasta",
      "Chicken",
      "Tacos",
    ];

    emit(
      HomeLoaded(
        sliderImages: sliderFakeData,
        items: listFakeData,
        sliderIndex: 0,
      ),
    );

    startAutoSlider();
  }

  void startAutoSlider() {
    sliderTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (state is HomeLoaded) {
        final s = state as HomeLoaded;

        int nextIndex = (s.sliderIndex + 1) % s.sliderImages.length;
        emit(s.copyWith(sliderIndex: nextIndex));
      }
    });
  }

  void changeSlideManually(int index) {
    if (state is HomeLoaded) {
      final s = state as HomeLoaded;
      emit(s.copyWith(sliderIndex: index));
    }
  }

  @override
  Future<void> close() {
    sliderTimer?.cancel();
    return super.close();
  }
}
