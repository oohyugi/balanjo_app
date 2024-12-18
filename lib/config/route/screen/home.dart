import 'package:balanjo_app/config/route/screen/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../src/features/home/bloc/bloc.dart';
import '../../../../src/features/home/home_screen.dart';
import '../../../../src/shared/bloc/bloc.dart';

@immutable
class HomeScreenRoute extends GoRouteData {

  @override
  buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
          key: state.pageKey,
          child:  MultiBlocProvider(
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
            child: const HomeScreen(),
          ),
          transitionsBuilder: (context, animation, animation2, child) =>
              CustomTransitionBuilder(animation: animation, child: child));
}
