import 'package:balanjo_app/config/route/safe_route.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/route/screen/screen.dart';
import '../../../shared/bloc/bloc.dart';
import '../../../shared/component/component.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        switch (state.uiState) {
          case SimpleUiState.initial:
            return const SizedBox(
              height: 134,
              child: PlaceholderCategory(),
            );
          case SimpleUiState.success:
            return Header(
              title: "Discover The Organic World",
              onTapMore: () {
                CategoriesScreenRoute().push(context);
              },
              child: SizedBox(
                height: 134,
                child: ListView.separated(
                  itemCount: state.categories.length,
                  cacheExtent: state.categories.length.toDouble(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 100,
                      child: CategoryImage(
                        item: state.categories[index],
                        onClick: () {
                          CollectionsScreenRoute(
                                  categoryId: state.categories[index].id)
                              .push(context);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SpaceHorizontal(size: 4);
                  },
                ),
              ),
            );
          case SimpleUiState.failure:
            return Container();
        }
      },
    );
  }
}

class PlaceholderCategory extends StatelessWidget {
  const PlaceholderCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 114,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            const SpaceVertical(size: 4),
            Container(
              height: 16,
              width: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Theme.of(context).colorScheme.background,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SpaceHorizontal(size: 4);
      },
    );
  }
}
