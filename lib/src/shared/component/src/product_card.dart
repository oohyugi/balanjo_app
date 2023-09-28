import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                  Expanded(
                    child: Text(product.basePrice.toIdr(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Theme.of(context).colorScheme.onBackground)),
                  )
              ],
            ),
          ),
          const SpaceVertical(size: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(product.displayPrice.toIdr(),
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

class ProductCardLoading extends StatelessWidget {
  const ProductCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerDefault(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 310,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            border: Border.all(
                width: 0.4, color: Theme.of(context).colorScheme.onBackground),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2 / 2,
              child: Container(
                height: 117,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0)),
                    color: Theme.of(context).colorScheme.surface),
              ),
            ),
            const SpaceVertical(size: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 11.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SpaceVertical(size: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 11.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SpaceVertical(size: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: 100,
                height: 8,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SpaceVertical(size: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 60,
                height: 12,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SpaceVertical(size: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 32,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SpaceVertical(size: 12),
          ],
        ),
      ),
    );
  }
}
