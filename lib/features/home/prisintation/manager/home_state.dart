abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> sliderImages;
  final List<String> items;
  final int sliderIndex;

  HomeLoaded({
    required this.sliderImages,
    required this.items,
    required this.sliderIndex,
  });

  HomeLoaded copyWith({
    List<String>? sliderImages,
    List<String>? items,
    int? sliderIndex,
  }) {
    return HomeLoaded(
      sliderImages: sliderImages ?? this.sliderImages,
      items: items ?? this.items,
      sliderIndex: sliderIndex ?? this.sliderIndex,
    );
  }
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
