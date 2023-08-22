import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/features/collections/bloc/bloc.dart';
import 'package:balanjo_app/src/features/collections/product_content.dart';
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
    this.id = 0,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    var initialIndex = 0;

    return Material(
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          if (state.uiState.isSuccess && state.categories.isNotEmpty) {
            final itemWithId = state.categories
                .firstWhereOrNull((element) => element.id == id);
            initialIndex =
                itemWithId != null ? state.categories.indexOf(itemWithId) : 0;
            context
                .read<CollectionsCubit>()
                .fetchProduct(state.categories[initialIndex].id);
          }
        },
        builder: (context, state) {
          if (state.uiState.isSuccess && state.categories.isNotEmpty) {
            return DefaultTabController(
              initialIndex: initialIndex,
              length: state.categories.length,
              child: Builder(builder: (context) {
                return BaseLayout(
                  title: const Search(),
                  tabBar: TabBar(
                    onTap: (index) {
                      context
                          .read<CollectionsCubit>()
                          .fetchProduct(state.categories[index].id);
                    },
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
                        .map((e) => BlocProvider(
                      create: (context) => CollectionsCubit(
                          collectionRepository: getIt())
                        ..fetchProduct(e.id),
                      child: ProductsContent(
                        key: Key(e.id.toString()),
                        id: e.id,
                      ),
                    ))
                        .toList(),
                  ),
                );
              }),
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}

