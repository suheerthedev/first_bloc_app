part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishlistActionState {}

final class WishlistInitial extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductModel> wishlistItems;
  WishlistSuccessState({required this.wishlistItems});
}

class WishlistErrorState extends WishlistState {}

class WishlistEmptyState extends WishlistState {}
