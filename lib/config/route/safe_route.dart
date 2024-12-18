import 'package:balanjo_app/config/route/screen/login.dart';
import 'package:balanjo_app/config/route/screen/maps.dart';
import 'package:balanjo_app/src/features/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../main.dart';
import '../../../src/features/home/bloc/bloc.dart';
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


// define your route here
// run "dart run build_runner build" in the terminal
@TypedGoRoute<MainScreenRoute>(path: '/', routes: [
  TypedGoRoute<HomeScreenRoute>(path: 'home', routes: [
    TypedGoRoute<CategoriesScreenRoute>(path: 'categories'),
    TypedGoRoute<CollectionsScreenRoute>(path: 'collections/:categoryId'),
    TypedGoRoute<ProductsScreenRoute>(path: 'products/:sectionId'),
    TypedGoRoute<CheckoutScreenRoute>(path: 'checkout'),
    TypedGoRoute<MapsScreenRoute>(path: 'maps'),
    TypedGoRoute<LoginScreenRoute>(path: 'login'),
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
