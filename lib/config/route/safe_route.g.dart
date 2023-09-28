// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainScreenRoute,
    ];

RouteBase get $mainScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $MainScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'home',
          factory: $HomeScreenRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'categories',
              factory: $CategoriesScreenRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'collections/:categoryId',
              factory: $CollectionsScreenRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'products/:sectionId',
              factory: $ProductsScreenRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'checkout',
              factory: $CheckoutScreenRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainScreenRouteExtension on MainScreenRoute {
  static MainScreenRoute _fromState(GoRouterState state) => MainScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CategoriesScreenRouteExtension on CategoriesScreenRoute {
  static CategoriesScreenRoute _fromState(GoRouterState state) =>
      CategoriesScreenRoute();

  String get location => GoRouteData.$location(
        '/home/categories',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CollectionsScreenRouteExtension on CollectionsScreenRoute {
  static CollectionsScreenRoute _fromState(GoRouterState state) =>
      CollectionsScreenRoute(
        categoryId: int.parse(state.pathParameters['categoryId']!),
      );

  String get location => GoRouteData.$location(
        '/home/collections/${Uri.encodeComponent(categoryId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductsScreenRouteExtension on ProductsScreenRoute {
  static ProductsScreenRoute _fromState(GoRouterState state) =>
      ProductsScreenRoute(
        sectionId: int.parse(state.pathParameters['sectionId']!),
        title: state.uri.queryParameters['title']!,
      );

  String get location => GoRouteData.$location(
        '/home/products/${Uri.encodeComponent(sectionId.toString())}',
        queryParams: {
          'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CheckoutScreenRouteExtension on CheckoutScreenRoute {
  static CheckoutScreenRoute _fromState(GoRouterState state) =>
      const CheckoutScreenRoute();

  String get location => GoRouteData.$location(
        '/home/checkout',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
