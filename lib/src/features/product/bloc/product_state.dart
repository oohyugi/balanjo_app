part of 'product_cubit.dart';

@immutable
class ProductState extends Equatable {
  final SimpleUiState uiState;
  final List<ProductModel> products;

  const ProductState._(
      {this.uiState = SimpleUiState.initial,
      this.products = const <ProductModel>[]});

  const ProductState.initial() : this._();

  const ProductState.success({required List<ProductModel> products})
      : this._(uiState: SimpleUiState.success, products: products);

  const ProductState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState, products];
}
