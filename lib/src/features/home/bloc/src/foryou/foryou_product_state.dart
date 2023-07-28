part of 'foryou_product_cubit.dart';

@immutable
sealed class ForyouProductState extends Equatable {
  const ForyouProductState();
}

class ForyouProductInitial extends ForyouProductState {
  @override
  List<Object> get props => [];
}

final class ForyouProductLoaded extends ForyouProductState {
  final List<ProductModel> products;

  const ForyouProductLoaded({required this.products});

  @override
  List<Object?> get props => [];
}
