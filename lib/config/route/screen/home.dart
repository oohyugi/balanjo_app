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
        child: const HomeScreen(),
      );
}
