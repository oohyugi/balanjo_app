import 'package:balanjo_app/src/features/collections/product_screen.dart';
import 'package:balanjo_app/src/features/home/main_screen.dart';
import 'package:balanjo_app/src/features/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../main.dart';
import '../../../src/features/categories/categories_drawer.dart';
import '../../../src/features/home/bloc/bloc.dart';
import '../../../src/features/order/bloc/bloc.dart';
import '../../../src/shared/bloc/bloc.dart';
import 'screen/screen.dart';

part 'safe_route.g.dart';

final safeRoute = GoRouter(
  routes: $appRoutes,
  initialLocation: "/",
  errorBuilder: (context, state) {
    return const Center(
      child: Text("Not Found"),
    );
  },
);

@TypedGoRoute<MainScreenRoute>(path: '/', routes: [
  TypedGoRoute<HomeScreenRoute>(path: 'home', routes: [
    TypedGoRoute<CategoriesScreenRoute>(path: 'categories'),
    TypedGoRoute<CollectionsScreenRoute>(path: 'collections/:categoryId'),
    TypedGoRoute<ProductsScreenRoute>(path: 'products/:sectionId'),
    TypedGoRoute<OrderScreenRoute>(path: 'order'),
  ]),
])
@immutable
class MainScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<HomeCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<CategoriesCubit>()..fetchCategories(),
          ),
          BlocProvider(
            create: (context) => getIt<ForyouProductCubit>()..fetchProduct(),
          ),
          BlocProvider(
            create: (context) => getIt<FlashSaleCubit>()..fetchProduct(),
          ),
        ],
        child: const MainScreen(),
      );
}
