import 'package:flutter/material.dart';

import '../../shared/model/model.dart';
import 'order_card.dart';

class OngoingScreen extends StatelessWidget {
  const OngoingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(bottom: 100,top: 16 ),
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OrderCard(
                history: HistoryMdl(
                    imageUrl: "https://loremflickr.com/240/240/fruit/all",
                    title: "Oder $i",
                    displayPrice: 10000,
                    id: i,
                    status: HistoryStatus.success,
                    date: '2023-07-08 15:40')),
          );
        },
        separatorBuilder: (context, i) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          );
        },
        itemCount: 1);
  }
}
