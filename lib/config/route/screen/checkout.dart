import 'package:balanjo_app/config/route/screen/transition.dart';
import 'package:balanjo_app/src/features/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../src/features/checkout/bloc/bloc.dart';

@immutable
class CheckoutScreenRoute extends GoRouteData {

  const CheckoutScreenRoute();

  @override
  buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
          key: state.pageKey,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<SummaryCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ItemCheckoutCubit>()..fetchItemsOrder(),
              ),
            ],
            child: const CheckoutScreen(),
          ),
          transitionsBuilder: (context, animation, animation2, child) =>
              CustomTransitionBuilder(animation: animation, child: child));
}