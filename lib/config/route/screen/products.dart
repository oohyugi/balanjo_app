import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../src/features/collections/product_screen.dart';
import '../../../../src/shared/bloc/bloc.dart';

@immutable
class ProductsScreenRoute extends GoRouteData {
  final int sectionId;
  final String title;

  const ProductsScreenRoute({required this.sectionId, required this.title});

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => getIt<CategoriesCubit>()..fetchCategories(),
        child: ProductScreen(sectionId: sectionId, title: title),
      );
}
