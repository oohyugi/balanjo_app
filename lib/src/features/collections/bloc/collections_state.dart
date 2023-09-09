part of 'collections_cubit.dart';

@immutable
class CollectionsState extends Equatable {
  final SimpleUiState uiState;
  final List<ProductModel> products;
  final bool hasReachedMax;

  const CollectionsState._(
      {this.uiState = SimpleUiState.initial,
      this.products = const <ProductModel>[],
      this.hasReachedMax = false});


  const CollectionsState.initial() : this._();

  const CollectionsState.success({required List<ProductModel> products, bool hasReachedMax = false })
      : this._(uiState: SimpleUiState.success, products: products,hasReachedMax: hasReachedMax);

  const CollectionsState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState, products,hasReachedMax];
}
