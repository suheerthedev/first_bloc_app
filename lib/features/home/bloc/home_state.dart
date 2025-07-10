part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState({required this.error});
}

class HomeNavigateToWishlistActionState extends HomeActionState {}

class HomeNavigateToCartActionState extends HomeActionState {}
