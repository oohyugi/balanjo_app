import 'package:balanjo_app/config/route/screen/transition.dart';
import 'package:balanjo_app/src/features/product/bloc/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../src/features/product/product_screen.dart';

@immutable
class ProductsScreenRoute extends GoRouteData {
  final int sectionId;
  final String title;

  const ProductsScreenRoute({required this.sectionId, required this.title});

  @override
  buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => getIt<ProductCubit>()..fetchProduct(sectionId),
            child: ProductScreen(sectionId: sectionId, title: title),
          ),
          transitionsBuilder: (context, animation, animation2, child) =>
              CustomTransitionBuilder(animation: animation, child: child));
}
