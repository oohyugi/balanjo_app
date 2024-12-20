
import 'package:balanjo_app/config/route/safe_route.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:balanjo_app/theme/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/route/screen/screen.dart';
import '../../bloc/bloc.dart';

class FloatingCart extends StatelessWidget {
  const FloatingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.uiState.isSuccess && state.cart?.totalItem != 0) {
          final totalItem = state.cart?.totalItem;
          final totalEstimatedPrice = state.cart?.totalEstimatedPrice ?? 0;
          return GestureDetector(
            onTap: () {
              const CheckoutScreenRoute().push(context);
            },
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Theme.of(context).colorScheme.primary,
              elevation: 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$totalItem items",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.w700)),
                          Text("Estimasi Harga",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  )),
                        ],
                      ),
                    ),
                    const SpaceHorizontal(size: 16),
                    Row(
                      children: [
                        Text(
                          totalEstimatedPrice.toIdr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w700),
                        ),
                        const SpaceHorizontal(size: 8),
                        SvgPicture.asset(
                          Assets.icCart,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.background,
                              BlendMode.srcIn),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
