import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class RouteDestination {
  static const collections = "collections";
  static const home = "home";
  static const main = "/";
  static const categories = "categories";
  static const orderConfirmation = "order_confirmation";

  static navigateToCollections(BuildContext context, int id) {
    context
        .pushNamed(RouteDestination.collections, pathParameters: {"id": "$id"});
  }
}
