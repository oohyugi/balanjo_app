part of 'home_cubit.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class ProductCart extends HomeState {
  final List<ProductModel> products;

  const ProductCart({required this.products});

  @override
  List<Object?> get props => [products];
}

final class CatalogLoaded extends HomeState {
  final List<ProductModel> products;

  const CatalogLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

