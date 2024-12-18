import 'package:balanjo_app/config/route/screen/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../src/features/categories/categories_screen.dart';
import '../../../../src/shared/bloc/bloc.dart';

@immutable
class CategoriesScreenRoute extends GoRouteData {

  @override
  buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => getIt<CategoriesCubit>()..fetchCategories(),
            child: const CategoriesScreen(),
          ),
          transitionsBuilder: (context, animation, animation2, child) =>
              CustomTransitionBuilder(animation: animation, child: child));
}
