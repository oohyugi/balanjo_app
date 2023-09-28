import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:flutter/material.dart';

import 'item_card.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key, required this.cartItems});
  final List<ProductModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ItemCard(product: cartItems[index]);
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(thickness: 0.2,),
          );
        },
        itemCount: cartItems.length);
  }
}

