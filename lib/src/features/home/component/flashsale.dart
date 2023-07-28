import 'package:balanjo_app/src/features/home/bloc/src/flashsale/flash_sale_cubit.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/extensions/date.dart';
import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:balanjo_app/src/utils/extensions/string_extentions.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/UiState.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlashSaleCubit, FlashSaleState>(
      builder: (context, state) {
        if (state.uiState.isSuccess) {
          final products = state.data?.products ?? [];
          final startDate = state.data?.startDate;
          final endDate = state.data?.endDate;
          final isShow = state.data?.isShow??false;
          final int flashSaleDuration =
              startDate.orEmpty.toDurationInSecond(endDate.orEmpty);
          return isShow && flashSaleDuration>0?Container(
            color: Theme.of(context).colorScheme.tertiary,
            margin: const EdgeInsets.only(top: 32),
            child: Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "Flash Deals",
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SpaceHorizontal(size: 16),
                            CountDown(second: flashSaleDuration,onEventEnded: ()=>context.read<FlashSaleCubit>()..hideFlashSale(),),
                          ],
                        ),
                      ),
                      const SpaceHorizontal(size: 16),
                      TextButton(
                          onPressed: () {},
                          child: Text("More",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary)))
                    ],
                  ),
                  const SpaceVertical(size: 8),
                  SizedBox(
                    height: 308,
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 156,
                            child: ProductCard(
                              product: products[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SpaceHorizontal(size: 4);
                        },
                        itemCount: products.length),
                  )
                ],
              ),
            ),
          ):Container();
        }
        else {
          return Container();
        }
      },
    );
  }
}

class CountDown extends StatelessWidget {
  const CountDown({super.key, required this.second, this.onEventEnded});

  final int second;
  final VoidCallback? onEventEnded;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          children: [
            Icon(
              Icons.timer_outlined,
              color: Theme.of(context).colorScheme.onError,
              size: 18,
            ),
            const SpaceHorizontal(size: 4),
            TweenAnimationBuilder<Duration>(
                duration: Duration(seconds: second),
                tween:
                    Tween(begin: Duration(seconds: second), end: Duration.zero),
                onEnd: onEventEnded,
                builder: (BuildContext context, Duration value, Widget? child) {
                  final minutes = (value.inMinutes % 60).toTime();
                  final hours = value.inHours.toTime();
                  final seconds = (value.inSeconds % 60).toTime();
                  return Text('$hours:$minutes:$seconds',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onError));
                }),
          ],
        ),
      ),
    );
  }
}
