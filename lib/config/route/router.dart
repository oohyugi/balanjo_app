import 'package:balanjo_app/config/route/route_destination.dart';
import 'package:balanjo_app/main.dart';
import 'package:balanjo_app/src/features/categories/categories_screen.dart';
import 'package:balanjo_app/src/features/collections/bloc/bloc.dart';
import 'package:balanjo_app/src/features/collections/collections_screen.dart';
import 'package:balanjo_app/src/features/home/bloc/bloc.dart';
import 'package:balanjo_app/src/features/home/home_screen.dart';

import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../src/features/home/main_screen.dart';
import '../../src/features/order_confirmation/bloc/bloc.dart';
import '../../src/features/order_confirmation/order_confirmation_screen.dart';
import '../../src/shared/bloc/bloc.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');
// late GoRouter appRouter;

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RouteDestination.main,
  errorBuilder: (context, state) {
    return const Text("Not Found");
  },
  routes: [
    // HomeScreen

    GoRoute(
        path: RouteDestination.main,
        builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<HomeCubit>(),
                ),
                BlocProvider(
                  create: (context) =>
                      getIt<CategoriesCubit>()..fetchCategories(),
                ),
                BlocProvider(
                  create: (context) =>
                      getIt<ForyouProductCubit>()..fetchProduct(),
                ),
                BlocProvider(
                  create: (context) => getIt<FlashSaleCubit>()..fetchProduct(),
                ),
              ],
              child: const MainScreen(),
            ),
        routes: [
          GoRoute(
              path: RouteDestination.home,
              builder: (context, state) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => getIt<HomeCubit>(),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<CategoriesCubit>()..fetchCategories(),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<ForyouProductCubit>()..fetchProduct(),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<FlashSaleCubit>()..fetchProduct(),
                      ),
                    ],
                    child: const HomeScreen(),
                  ),
              routes: [
                GoRoute(
                    name: RouteDestination.categories,
                    path: RouteDestination.categories,
                    builder: (context, state) => BlocProvider(
                          create: (context) =>
                              getIt<CategoriesCubit>()..fetchCategories(),
                          child: const CategoriesScreen(),
                        ),
                    routes: []),
                GoRoute(
                    path: "${RouteDestination.collections}/:id",
                    name: RouteDestination.collections,
                    builder: (context, state) => MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) => getIt<CollectionsCubit>(),
                            ),
                            BlocProvider(
                              create: (context) =>
                                  getIt<CategoriesCubit>()..fetchCategories(),
                            ),
                          ],
                          child: CollectionsScreen(
                            id: state.pathParameters['id']??"0",
                          ),
                        )),
                GoRoute(
                    path: RouteDestination.orderConfirmation,
                    name: RouteDestination.orderConfirmation,
                    builder: (context, state) => MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) => getIt<SummaryOrderCubit>(),
                            ),
                            BlocProvider(
                              create: (context) => getIt<ItemOrderCubit>()..fetchItemsOrder(),
                            ),
                          ],
                          child: const OrderConfirmationScreen(),
                        ))
              ]),
        ])
    // PlaylistHomeScreen
  ],
);
