import 'package:balanjo_app/src/shared/component/src/shimmer_loading.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/component/component.dart';
import '../bloc/bloc.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryOrderCubit, SummaryOrderState>(
      builder: (context, state) {
        return BottomSheet(
          elevation: 1,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8))),
          onClosing: () {},
          enableDrag: false,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceVertical(size: 16),
                    Text(
                      "Total Pembayaran",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    ShimmerLoading(
                      isLoading: state.uiState.isInitial && state.data == null,
                      child: state.uiState.isInitial && state.data == null
                          ? Container(
                              width: 80,
                              height: 16,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Theme.of(context).colorScheme.surface))
                          : Text(state.data?.totalPrice.toIdr() ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.w700)),
                    ),
                    const SpaceVertical(size: 12),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                            minimumSize: const Size(100, 52),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14))),
                        child: const Text("Checkout"),
                      ),
                    ),
                    const SpaceVertical(size: 12)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
