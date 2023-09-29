import 'package:balanjo_app/config/route/safe_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route/screen/products.dart';
import '../../../shared/component/component.dart';
import '../bloc/bloc.dart';

class ForYou extends StatelessWidget {
  const ForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForyouProductCubit, ForyouProductState>(
      builder: (context, state) {
        return switch (state) {
          ForyouProductInitial() => Container(),
          ForyouProductLoaded() => Header(
              title: "Spesial Untuk Kamu",
              onTapMore: () {
                const ProductsScreenRoute(
                    sectionId: 2, title: "Spesial Untuk Kamu").push(context);
              },
              child: SizedBox(
                height: 310,
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    scrollDirection: Axis.horizontal,
                    cacheExtent: state.products.length.toDouble(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 156,
                        child: ProductCard(
                          product: state.products[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SpaceHorizontal(size: 4);
                    },
                    itemCount: state.products.length),
              ))
        };
      },
    );
  }
}
