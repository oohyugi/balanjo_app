import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../shared/component/component.dart';
import 'bloc/bloc.dart';

class ProductsContent extends StatelessWidget {
  const ProductsContent({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsCubit, CollectionsState>(
      builder: (context, state) {
        if (state.uiState.isSuccess && state.products.isNotEmpty) {
          return ResponsiveGridList(
              minItemWidth: MediaQuery.of(context).size.width / 2.5,
              maxItemsPerRow: 2,
              horizontalGridSpacing: 8,
              verticalGridSpacing: 8,
              horizontalGridMargin: 16,
              verticalGridMargin: 16,
              listViewBuilderOptions:
                  ListViewBuilderOptions(padding: EdgeInsets.only(bottom: 68)),
              children: state.products
                  .map((e) => ProductCard(
                        product: e,
                      ))
                  .toList());
        } else if (state.uiState.isInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child:
              Text("No Product", style: Theme.of(context).textTheme.bodySmall),
        );
      },
    );
  }
}
