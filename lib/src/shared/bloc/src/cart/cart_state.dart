part of 'cart_cubit.dart';

@immutable
class CartState extends Equatable {
  final SimpleUiState uiState;
  final CartModel? cart;

  const CartState._({this.uiState = SimpleUiState.initial, this.cart});

  const CartState.initial() : this._();

  const CartState.success({required CartModel cart})
      : this._(uiState: SimpleUiState.success, cart: cart);

  const CartState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState, cart];
}
