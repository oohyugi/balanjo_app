import 'package:balanjo_app/config/route/safe_route.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/route/screen/collections.dart';
import '../../shared/bloc/bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: const Text("Categories"),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state.uiState.isSuccess && state.categories.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
                itemCount: state.categories.length,
                cacheExtent: state.categories.length.toDouble(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.79,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2
                ),
                itemBuilder: (context, index) {
                 return CategoryImage(
                    item: state.categories[index],
                    onClick: () {
                      CollectionsScreenRoute(categoryId:  state.categories[index].id)
                          .push(context);
                    },
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
