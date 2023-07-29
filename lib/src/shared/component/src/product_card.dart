import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:balanjo_app/theme/colors.dart';
import 'package:balanjo_app/theme/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../component.dart';
import '../../model/src/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 / 2,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0)),
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      height: 117,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    right: 8,
                    top: 8,
                    child:
                        Tapper(onTap: () {}, child: SvgPicture.asset(icHeart)))
              ],
            ),
          ),
          const SpaceVertical(size: 12.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 34.0,
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ),
          ),
          const SpaceVertical(size: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                if (product.discountPercent != 0)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      color: Theme.of(context).colorScheme.error,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 3.0),
                      child: Text("-${product.discountPercent}%",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.onError,
                                  fontWeight: FontWeight.w700)),
                    ),
                  ),
                if (product.discountPercent != 0)
                  const SpaceHorizontal(size: 8.0),
                if (product.discountPercent != 0)
                  Text(product.basePrice.toIdr(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Theme.of(context).colorScheme.onBackground))
              ],
            ),
          ),
          const SpaceVertical(size: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
               product.displayPrice.toIdr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w700)),
          ),
          const SpaceVertical(size: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AddCart(
              product: product,
            ),
          ),
          const SpaceVertical(size: 12),
        ],
      ),
    );
  }
}
