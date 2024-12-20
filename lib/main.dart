import 'package:balanjo_app/src/features/collections/di/collections_module.dart';
import 'package:balanjo_app/src/features/map/map_module.dart';
import 'package:balanjo_app/src/features/product/di/product_module.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/bloc/src/cart/cart_cubit.dart';
import 'package:balanjo_app/src/features/home/di/home_module.dart';
import 'package:balanjo_app/src/shared/di/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config/bloc_observer.dart';
import 'config/route/safe_route.dart';
import 'src/features/checkout/di/module.dart';
import 'theme/color_schemes.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  homeModule();
  sharedModule();
  collectionsModule();
  checkoutModule();
  productModule();
  mapModule();
  Bloc.observer = BBlocObserve();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CartCubit>()..fetchCart(),
        ),
        BlocProvider(
          create: (context) => getIt<LocationCubit>()..getLastLocation(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Balanjo',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: GoogleFonts.nunitoTextTheme(),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: GoogleFonts.nunitoTextTheme(),
        ),
        routeInformationParser: safeRoute.routeInformationParser,
        routeInformationProvider: safeRoute.routeInformationProvider,
        routerDelegate: safeRoute.routerDelegate,
      ),
    );
  }
}
