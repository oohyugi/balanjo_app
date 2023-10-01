import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:balanjo_app/theme/icons.dart';
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
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  history.date,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                ),
                const SpaceVertical(size: 4),
                Text(
                  "${history.totalItems} item",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold),
                ),
                const SpaceVertical(size: 4),
                Text(
                  history.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
                const SpaceVertical(size: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 0.2,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 4,
                          decoration: BoxDecoration(
                              color: getStatusColor(context, history.status),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )),
                        ),
                        const SpaceVertical(size: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              SvgIcon(
                                  getAssetName(context, history.status),color: getStatusColor(context, history.status),width: 18,height: 18),
                              const SpaceHorizontal(size: 8),
                              Text(getTitle(context, history.status),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        if (history.status == HistoryStatus.waiting)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                "Lanjutkan bayar dengan VA Mandiri, selesaikan pembayaran dalam 10:10:30, Abaikan jika sudah membayar, verifikasi membutuhkan waktu 5 menit.",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    )),
                          ),
                        const SpaceVertical(size: 16)
                      ],
                    ),
                  ),
                ),
                const SpaceVertical(size: 16),
                const Divider(
                  thickness: 0.5,
                ),
                getActionButton(context, history.status).isNotEmpty
                    ? const SpaceVertical(size: 8)
                    : const SpaceVertical(size: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        history.displayPrice.toIdr(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                        softWrap: true,
                      ),
                    ),
                    if (getActionButton(context, history.status).isNotEmpty)
                      FilledButton(
                          style: FilledButton.styleFrom(
                              minimumSize: const Size(100, 32),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {},
                          child: Text(getActionButton(context, history.status)))
                  ],
                )
              ],
            ),
          ),
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

Color getStatusColor(BuildContext context, HistoryStatus status) {
  return switch (status) {
    HistoryStatus.waiting => Colors.yellow.shade800,
    HistoryStatus.progress => Colors.blue.shade800,
    HistoryStatus.success => Colors.green.shade800,
    HistoryStatus.cancelled => Colors.red.shade800,
  };
}

String getTitle(BuildContext context, HistoryStatus status) {
  return switch (status) {
    HistoryStatus.waiting => "Menunggu Pembayaran",
    HistoryStatus.progress => "Pesanan di Proses",
    HistoryStatus.success => "Selesai",
    HistoryStatus.cancelled => "Dibatalkan",
  };
}

String getAssetName(BuildContext context, HistoryStatus status) {
  return switch (status) {
    HistoryStatus.waiting => Assets.icClock,
    HistoryStatus.progress => Assets.icDelivery,
    HistoryStatus.success => Assets.icChecked,
    HistoryStatus.cancelled => Assets.icCancel,
  };
}

String getActionButton(BuildContext context, HistoryStatus status) {
  return switch (status) {
    HistoryStatus.waiting => "Bayar",
    HistoryStatus.progress => "",
    HistoryStatus.success => "Beli Lagi",
    HistoryStatus.cancelled => "",
  };
}

class HistoryMdl {
  final String imageUrl;
  final String title;
  final double displayPrice;
  final int id;
  final HistoryStatus status;
  final int totalItems;
  final String date;

  HistoryMdl(
      {required this.imageUrl,
      required this.title,
      required this.displayPrice,
      required this.id,
      required this.status,
      required this.date,
      required this.totalItems});
}

enum HistoryStatus { waiting, progress, success, cancelled }
