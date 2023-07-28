import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/route/route_destination.dart';
import '../../../shared/bloc/bloc.dart';
import '../../../shared/component/component.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state.uiState.isSuccess && state.categories.isNotEmpty) {
          return Header(
            title: "Discover The Organic World",
            onTapMore: () {
              context.pushNamed(RouteDestination.categories);
            },
            child: SizedBox(
              height: 134,
              child: ListView.separated(
                itemCount: state.categories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100,
                    child: CategoryImage(
                      item: state.categories[index],
                      onClick: () {
                        RouteDestination.navigateToCollections(context, state.categories[index].id);
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
