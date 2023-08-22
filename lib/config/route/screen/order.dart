import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../src/features/order/bloc/bloc.dart';
import '../../../../src/features/order/order_screen.dart';

@immutable
class OrderScreenRoute extends GoRouteData {

  const OrderScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<SummaryOrderCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<ItemOrderCubit>()..fetchItemsOrder(),
      ),
    ],
    child: const OrderScreen(),
  );
}