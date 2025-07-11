import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/cart_items.dart';
import 'package:bloc_practice/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState());
    await Future.delayed(Duration(seconds: 3));
    if (CartItems.cartItems.isNotEmpty) {
      emit(CartSuccessState(cartItems: CartItems.cartItems));
    } else {
      emit(CartEmptyState());
    }
  }

  FutureOr<void> cartRemoveFromCartEvent(
    CartRemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) {
    CartItems.cartItems.remove(event.cartItem);
    emit(CartRemoveActionState());
    if (CartItems.cartItems.isEmpty) {
      emit(CartEmptyState());
    } else {
      emit(CartSuccessState(cartItems: CartItems.cartItems));
    }
  }
}
