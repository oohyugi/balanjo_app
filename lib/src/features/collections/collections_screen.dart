import 'package:balanjo_app/src/features/collections/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../shared/bloc/bloc.dart';
import '../../shared/component/src/product_card.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({
    super.key,
    this.id = "2",
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state.uiState.isSuccess && state.categories.isNotEmpty) {
          final itemWithId =
              state.categories.firstWhereOrNull((element) => element.id == id);
          final initialIndex =
              itemWithId != null ? state.categories.indexOf(itemWithId) : 0;

          context.read<CollectionsCubit>().fetchProduct(id);
          return DefaultTabController(
            initialIndex: initialIndex,
            length: state.categories.length,
            child: BaseLayout(
              title: const Text("Product"),
              tabBar: TabBar(
                tabs: state.categories
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 8.0),
                          child: Text(e.name.toLowerCase().capitalize),
                        ))
                    .toList(),
                isScrollable: true,
              ),
              body: TabBarView(
                children: state.categories
                    .map((e) => BlocBuilder<CollectionsCubit, CollectionsState>(
                          builder: (context, state) {
                            if (state.uiState.isSuccess &&
                                state.products.isNotEmpty) {
                              return ResponsiveGridList(
                                  minItemWidth:
                                      MediaQuery.of(context).size.width / 2.5,
                                  maxItemsPerRow: 2,
                                  horizontalGridSpacing: 8,
                                  verticalGridSpacing: 8,
                                  horizontalGridMargin: 16,
                                  verticalGridMargin: 16,
                                  listViewBuilderOptions:
                                      ListViewBuilderOptions(
                                          padding: EdgeInsets.only(bottom: 68)),
                                  children: state.products
                                      .map((e) => ProductCard(
                                            product: e,
                                          ))
                                      .toList());
                            }
                            return Container();
                          },
                        ))
                    .toList(),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
