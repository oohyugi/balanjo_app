import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../shared/bloc/bloc.dart';
import '../../shared/component/component.dart';
import '../../shared/model/model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    context.read<CategoriesCubit>().fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Menu"),
            ),
            body: CategoriesWidget(
              categories: state.categories,
              onItemClick: (String categoryId, String subCategoryId,
                  String childCategoryId) {
                context.push("/collections");
              },
            ),
          );
        },
      ),
    );
  }
}

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({
    super.key,
    required this.categories,
    required this.onItemClick,
  });

  final List<CategoriesModel> categories;
  final Function(
          String categoryId, String subCategoryId, String childCategoryId)
      onItemClick;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  var categorySelectedIndex = 0;
  var subCategorySelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
          child: Card(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            elevation: 0,
            child: ListView.builder(
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      categorySelectedIndex = i;
                    });
                  },
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    elevation: categorySelectedIndex == i ? 4 : 0,
                    shadowColor: categorySelectedIndex == i
                        ? Theme.of(context).colorScheme.shadow
                        : Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.categories[i].name
                                  .toLowerCase()
                                  .capitalize,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              softWrap: true,
                            ),
                          ),
                          const SpaceHorizontal(size: 16),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.categories.length,
            ),
          ),
        ),
        // SubCategoryWidget(
        //   items: widget.categories[categorySelectedIndex].subCategories,
        //   onClick: (childId, subId) => widget.onItemClick(
        //       widget.categories[categorySelectedIndex].id, subId, childId),
        // )
      ],
    );
  }
}

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({
    super.key,
    required this.items,
    required this.onClick,
  });

  final List<SubCategoryModel> items;
  final Function(String childCategoryId, String subCategoryId) onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, i) {
            final subCategory = items[i];
            return ExpansionTile(
              initiallyExpanded: i == 0,
              expandedAlignment: Alignment.topLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              backgroundColor: Theme.of(context).colorScheme.surface,
              shape: const Border(),
              title: Text(
                subCategory.name.toLowerCase().capitalize,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                softWrap: true,
              ),
              children: []
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
