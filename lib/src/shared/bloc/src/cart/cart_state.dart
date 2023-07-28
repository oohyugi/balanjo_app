part of 'cart_cubit.dart';

@immutable
class CartState extends Equatable {
  final SimpleUiState uiState;
  final List<ProductModel> products;


  const CartState._(
      {this.uiState = SimpleUiState.initial,
      this.products = const <ProductModel>[]});

  const CartState.initial() : this._();

  const CartState.success({required List<ProductModel> products})
      : this._(uiState: SimpleUiState.success, products: products);

  const CartState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState, products];
}
