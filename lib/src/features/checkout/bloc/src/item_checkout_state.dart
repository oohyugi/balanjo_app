part of 'item_checkout_cubit.dart';

class ItemCheckoutState extends Equatable {
  final SimpleUiState uiState;
  final List<ProductModel> products;

  const ItemCheckoutState._({
    this.uiState = SimpleUiState.initial,
    this.products = const [],
  });

  const ItemCheckoutState.loading() : this._();

  const ItemCheckoutState.success(List<ProductModel> products)
      : this._(uiState: SimpleUiState.success, products: products);

  const ItemCheckoutState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState, products];
}
