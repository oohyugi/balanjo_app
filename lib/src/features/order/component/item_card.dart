import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/component/component.dart';
import '../../../shared/model/model.dart';
import '../bloc/bloc.dart';
import 'button_cart.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SpaceHorizontal(size: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SpaceVertical(size: 4),
              SizedBox(
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
              ),
              const SpaceVertical(size: 4),
              Row(
                children: [
                  Text(product.displayPrice.toIdr(),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onBackground)),
                  const SpaceHorizontal(size: 4),
                  if (product.discountPercent != 0)
                    Text(product.basePrice.toIdr(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w400)),
                ],
              ),
              const SpaceVertical(size: 8),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 3.4,
                  child: BlocBuilder<SummaryOrderCubit, SummaryOrderState>(
                    builder: (context, state) {
                      if (state.uiState.isSuccess) {
                        return ButtonCart(
                          product: product,
                        );
                      }
                      return const ShimmerDefault(
                        child: RoundedPlaceHolder(
                          height: 32,
                          width: 120,
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
