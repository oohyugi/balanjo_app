import 'package:balanjo_app/src/features/myorder/order_card.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/shared/model/src/product_model.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(bottom: 100, top: 16),
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OrderCard(
                history: HistoryMdl(
                    imageUrl: "https://loremflickr.com/240/240/fruit/all",
                    title:
                        "Oder $i , order juga, pisang keju, buah nangka, apel malang",
                    displayPrice: 10000,
                    id: i,
                    status: i % 2 == 0
                        ? HistoryStatus.cancelled
                        : HistoryStatus.success,
                    totalItems: 4,
                    date: '2023-07-08 15:40')),
          );
        },
        separatorBuilder: (context, i) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              thickness: 0.5,
            ),
          );
        },
        itemCount: 5);
  }
}
