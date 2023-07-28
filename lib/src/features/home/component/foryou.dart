import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              onTapMore: () {},
              child: SizedBox(
                height: 308,
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
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
