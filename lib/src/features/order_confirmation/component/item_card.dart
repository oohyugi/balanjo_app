import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/component.dart';
import '../../../shared/model/model.dart';

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
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SpaceHorizontal(size: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SpaceVertical(size: 4),
            SizedBox(
              child: Text(
                product.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
                maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            const SpaceVertical(size: 4),
            Row(
              children: [
                Text(
                    product.discountPrice != 0
                        ? product.discountPrice.toIdr()
                        : product.basePrice.toIdr(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onBackground)),
                const SpaceHorizontal(size: 4),
                if (product.discountPrice != 0)
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
                child: AddCart(product: product)),
          ],
        ),
      ],
    );
  }
}
