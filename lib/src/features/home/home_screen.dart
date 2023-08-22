import 'package:balanjo_app/src/features/home/component/flashsale.dart';
import 'package:balanjo_app/src/features/home/component/foryou.dart';
import 'package:balanjo_app/src/features/home/component/caraousel.dart';
import 'package:balanjo_app/src/shared/component/src/search.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:flutter/material.dart';

import 'component/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      isHideAppBar: true,
      title: Container(),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            SpaceVertical(size: 18),
            SizedBox(
              height: 158,
              child: Carousell(),
            ),
            SpaceVertical(size: 18),
            CategoryList(),
            FlashSale(),
            SpaceVertical(size: 18),
            ForYou(),
            SpaceVertical(size: 100),
          ],
        ),
      ),
    );
  }
}
