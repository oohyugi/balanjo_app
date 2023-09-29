import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryImage extends StatelessWidget {
  const CategoryImage({super.key, required this.item, required this.onClick});

  final CategoryModel item;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Tapper(
      onTap: onClick,
      borderRadius:  BorderRadius.circular(8),
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 1.2,
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                        item.imageUrl.orEmpty,
                      ),fit: BoxFit.cover)),
                )),
            const SpaceVertical(size: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                item.name.toLowerCase().capitalize,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onBackground,fontWeight: FontWeight.w600),
              ),
            ),
            const SpaceVertical(size: 8)
          ],
        ),
      ),
    );
  }
}
