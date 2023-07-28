import 'package:balanjo_app/config/route/route_destination.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../shared/bloc/bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: Text("Categories"),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state.uiState.isSuccess && state.categories.isNotEmpty) {
            return ResponsiveGridList(
                minItemWidth: MediaQuery.of(context).size.width / 4,
                maxItemsPerRow: 3,
                horizontalGridSpacing: 4,
                verticalGridSpacing: 4,
                horizontalGridMargin: 16,
                verticalGridMargin: 16,
                listViewBuilderOptions: ListViewBuilderOptions(
                    padding: const EdgeInsets.only(bottom: 68)),
                children: state.categories
                    .map((e) => CategoryImage(
                          item: e,
                          onClick: () {
                            RouteDestination.navigateToCollections(
                                context, e.id);
                          },
                        ))
                    .toList());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
