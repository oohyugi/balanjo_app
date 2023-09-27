import 'package:balanjo_app/src/features/myorder/history_screen.dart';
import 'package:balanjo_app/src/features/myorder/ongoing_screen.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Builder(builder: (context) {
          return BaseLayout(
            isHideAppBar: true,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  tabAlignment: TabAlignment.start,
                  onTap: (index) {},
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 8.0),
                      child: Text("History"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 8.0),
                      child: Text("Ongoing"),
                    )
                  ],
                  isScrollable: true,
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      HistoryScreen(),
                     OngoingScreen()
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
