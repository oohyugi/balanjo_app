import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/features/collections/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  actions: const [
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Search(
                        isShowOnlyIcon: true,
                      ),
                    )
                  ],
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ProductsContent extends StatefulWidget {
  const ProductsContent({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ProductsContent> createState() => _ProductsContentState();
}

class _ProductsContentState extends State<ProductsContent> {
  final _scrollController = ScrollController();
  bool shouldLoadMore = true;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CollectionsCubit>().fetchProduct(widget.id);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    logDebug(tag: "scroll", message: "max $maxScroll, curr $currentScroll");
    return maxScroll > currentScroll && (maxScroll - currentScroll) <= 100;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsCubit, CollectionsState>(
      builder: (context, state) {
        logDebug(tag: "hasReachMax", message: state.hasReachedMax);
        if (state.uiState.isSuccess) {
          if (state.products.isEmpty) {
            return Center(
              child: Text(
                "Product not available",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            );
          }

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                GridView.builder(
                    itemCount:
                        !state.hasReachedMax && state.products.length > 9
                            ? state.products.length + 2
                            : state.products.length,
                    cacheExtent:
                        !state.hasReachedMax && state.products.length > 9
                            ? state.products.length + 2.toDouble()
                            : state.products.length.toDouble(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.53,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2),
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      if (index > state.products.length - 1) {
                        return const ProductCardLoading();
                      }
                      return ProductCard(
                        key: Key(state.products[index].id.toString()),
                        product: state.products[index],
                      );
                    }),
              ],
            ),
          );
        } else if (state.uiState.isFailure) {
          return Center(
            child: Text("No Product Found",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w400)),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
