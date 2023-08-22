import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../src/features/categories/categories_screen.dart';
import '../../../../src/shared/bloc/bloc.dart';

@immutable
class CategoriesScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => getIt<CategoriesCubit>()..fetchCategories(),
        child: const CategoriesScreen(),
      );
}
