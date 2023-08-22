part of 'item_order_cubit.dart';

class ItemOrderState extends Equatable {
  final SimpleUiState uiState;
  final List<ProductModel> products;

  const ItemOrderState._({
    this.uiState = SimpleUiState.initial,
    this.products = const [],
  });

  const ItemOrderState.loading() : this._();

  const ItemOrderState.success(List<ProductModel> products)
      : this._(uiState: SimpleUiState.success, products: products);

  const ItemOrderState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState, products];
}
