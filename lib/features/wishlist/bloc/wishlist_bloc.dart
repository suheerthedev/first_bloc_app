import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/wishlist_items.dart';
import 'package:bloc_practice/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoadingState());
    await Future.delayed(Duration(seconds: 3));

    if (WishlistItems.wishlistItems.isNotEmpty) {
      emit(WishlistSuccessState(wishlistItems: WishlistItems.wishlistItems));
    } else {
      emit(WishlistEmptyState());
    }
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(
    WishlistRemoveFromWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    WishlistItems.wishlistItems.remove(event.wishlistItem);
    if (WishlistItems.wishlistItems.isEmpty) {
      emit(WishlistEmptyState());
    } else {
      emit(WishlistSuccessState(wishlistItems: WishlistItems.wishlistItems));
    }
  }
}
