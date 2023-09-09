import 'package:balanjo_app/src/features/product/bloc/product_cubit.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(
      {super.key, required this.sectionId, required this.title});

  final int sectionId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: Text(title),

        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state.uiState.isSuccess && state.products.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                    itemCount: state.products.length,
                    cacheExtent: state.products.length.toDouble(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.53,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: state.products[index],
                      );
                    }),
              );
            } else if (state.uiState.isInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container();
          },
        ));
  }
}
