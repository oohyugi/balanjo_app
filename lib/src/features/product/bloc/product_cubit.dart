import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../shared/model/model.dart';
import '../../../utils/UiState.dart';
import '../repository/product_repository.dart';



part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(const ProductState.initial());

  void fetchProduct(int sectionId) async {
    emit(const ProductState.initial());
    final response = await productRepository.fetchProductSection(sectionId);
    if (response.isEmpty) {
      emit(const ProductState.failure());
    } else {
      emit(ProductState.success(products: response));
    }
  }
}
