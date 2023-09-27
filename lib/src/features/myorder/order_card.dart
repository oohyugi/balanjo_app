import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../shared/component/component.dart';
import '../../shared/model/model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.history});

  final HistoryMdl history;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              history.date,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: history.imageUrl,
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
                          history.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                          textAlign: TextAlign.start,
                          softWrap: true,
                        ),
                      ),
                      const SpaceVertical(size: 4),
                      Row(
                        children: [
                          Text(history.displayPrice.toIdr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                          const SpaceHorizontal(size: 4),
                        ],
                      ),
                      const SpaceVertical(size: 8),
                      Text(history.status.name,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        // Positioned(
        //   right: 0,
        //   bottom: 4,
        //   child: FilledButton(
        //     onPressed: () {},
        //     style: FilledButton.styleFrom(
        //         minimumSize: const Size(80, 32),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(14))),
        //     child: const Text("Beli Lagi"),
        //   ),
        // ),
      ],
    );
  }
}

class HistoryMdl {
  final String imageUrl;
  final String title;
  final double displayPrice;
  final int id;
  final HistoryStatus status;
  final String date;

  HistoryMdl(
      {required this.imageUrl,
      required this.title,
      required this.displayPrice,
      required this.id,
      required this.status,
      required this.date});
}

enum HistoryStatus { progress(), success, cancelled }
