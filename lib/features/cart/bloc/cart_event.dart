part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductModel cartItem;
  CartRemoveFromCartEvent({required this.cartItem});
}
