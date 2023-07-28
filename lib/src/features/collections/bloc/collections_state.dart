part of 'collections_cubit.dart';

@immutable
class CollectionsState extends Equatable {
  final SimpleUiState uiState;
  final List<ProductModel> products;

  const CollectionsState._(
      {this.uiState = SimpleUiState.initial,
      this.products = const <ProductModel>[]});

  const CollectionsState.initial() : this._();

  const CollectionsState.success({required List<ProductModel> products})
      : this._(uiState: SimpleUiState.success, products: products);

  const CollectionsState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState, products];
}
