import 'dart:ffi';

import 'package:balanjo_app/src/features/map/presentation/map_screen.dart';
import 'package:balanjo_app/src/features/product/bloc/product_cubit.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
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
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => getIt<LocationCubit>()..getLocation(),
        child: MapScreen(
          initialLocation: LatLng(latitude, longitude),
        ),
      );
}
