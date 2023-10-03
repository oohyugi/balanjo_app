import 'dart:ffi';

import 'package:balanjo_app/src/features/map/bloc/map_cubit.dart';
import 'package:balanjo_app/src/features/map/presentation/map_screen.dart';
import 'package:balanjo_app/src/features/product/bloc/product_cubit.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../main.dart';
import '../../../src/features/product/product_screen.dart';

@immutable
class MapsScreenRoute extends GoRouteData {
  final double latitude;
  final double longitude;

  const MapsScreenRoute({required this.latitude, required this.longitude});

  @override
  buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child:MultiBlocProvider(
          providers: [

            BlocProvider(
              create: (context) => getIt<MapCubit>(),
            ),
          ],
          child: MapScreen(
            initialLocation: LatLng(latitude, longitude),
          ),
        ),
        transitionsBuilder: (context, animation, animation2, child) =>
            SlideTransition(
                position: animation.drive(
                  Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ),
                ),
                child: child),
      );
  
}
  
