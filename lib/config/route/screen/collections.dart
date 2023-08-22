import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../src/features/collections/bloc/bloc.dart';
import '../../../../src/features/collections/collections_screen.dart';
import '../../../../src/features/collections/product_screen.dart';
import '../../../../src/shared/bloc/bloc.dart';

@immutable
class CollectionsScreenRoute extends GoRouteData {
  final int categoryId;

  const CollectionsScreenRoute({required this.categoryId});

  @override
  Widget build(BuildContext context, GoRouterState state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<CollectionsCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<CategoriesCubit>()..fetchCategories(),
          ),
        ],
        child: CollectionsScreen(
          id: categoryId,
        ),
      );
}
