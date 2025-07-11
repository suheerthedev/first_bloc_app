part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductModel product;
  HomeProductWishlistButtonClickedEvent({required this.product});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel product;
  HomeProductCartButtonClickedEvent({required this.product});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
