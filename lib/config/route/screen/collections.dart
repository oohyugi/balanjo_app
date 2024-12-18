import 'package:balanjo_app/config/route/screen/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../src/features/collections/bloc/bloc.dart';
import '../../../../src/features/collections/collections_screen.dart';
import '../../../../src/shared/bloc/bloc.dart';

@immutable
class CollectionsScreenRoute extends GoRouteData {
  final int categoryId;

  const CollectionsScreenRoute({required this.categoryId});

  @override
  buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
          key: state.pageKey,
          child: MultiBlocProvider(
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
          ),
          transitionsBuilder: (context, animation, animation2, child) =>
              CustomTransitionBuilder(animation: animation, child: child));
}
