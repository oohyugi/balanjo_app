import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/component/component.dart';
import '../bloc/bloc.dart';

class PricingDetail extends StatelessWidget {
  const PricingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryOrderCubit, SummaryOrderState>(
      builder: (context, state) {
        if (state.uiState.isSuccess && state.data != null) {}
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            ItemPrice(
                isLoading: state.uiState.isInitial,
                title: "Estimated Price",
                value: state.data?.estimatedPrice.toIdr() ?? ""),
            ItemPrice(
              isLoading: state.uiState.isInitial,
              title: "Ongkos kirim",
              value: state.data?.deliveryFee.toIdr() ?? "",
              valueColor: Theme.of(context).colorScheme.primary,
            ),
            ItemPrice(
              isLoading: state.uiState.isInitial,
              title: "Diskon",
              value: "- ${state.data?.totalDiscount.toIdr()}",
              valueColor: Theme.of(context).colorScheme.error,
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

class ItemPrice extends StatelessWidget {
  const ItemPrice(
      {super.key,
      required this.title,
      required this.value,
      this.valueColor,
      required this.isLoading});

  final String title;
  final String value;
  final Color? valueColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            isLoading
                ? const ShimmerDefault(
                    child: RoundedPlaceHolder(
                    height: 14,
                    width: 80,
                  ),
                )
                : Text(value,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: valueColor ??
                            Theme.of(context).colorScheme.onBackground)),
          ],
        ),
      ),
    );
  }
}
