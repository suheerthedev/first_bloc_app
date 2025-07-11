import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/cart_items.dart';
import 'package:bloc_practice/data/grocery_data.dart';
import 'package:bloc_practice/data/wishlist_items.dart';
import 'package:bloc_practice/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
      homeProductWishlistButtonClickedEvent,
    );
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoadingState());
      await Future.delayed(Duration(seconds: 3));
      emit(
        HomeLoadedSuccessState(
          products: GroceryData.groceryProducts
              .map((e) => ProductModel.fromJson(e))
              .toList(),
        ),
      );
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wishlist navigation clicked");

    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart navigation clicked");
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wishlist product clicked");
    if (WishlistItems.wishlistItems.contains(event.product)) {
      emit(HomeProductItemAlreadyInWishlistActionState());
    } else {
      WishlistItems.wishlistItems.add(event.product);
      emit(HomeProductItemWishlistedActionState());
    }
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart product clicked");
    if (CartItems.cartItems.contains(event.product)) {
      emit(HomeProductItemAlreadyInCartActionState());
    } else {
      CartItems.cartItems.add(event.product);
      emit(HomeProductItemCartedActionState());
    }
  }
}
