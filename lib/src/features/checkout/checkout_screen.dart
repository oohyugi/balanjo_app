import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/theme/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'bloc/bloc.dart';
import 'component/checkout.dart';
import 'component/pricing_detail.dart';
import 'component/shopping_cart.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      isShowFloatingCart: false,
      title: const Text("Keranjang"),
      body: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            context.read<ItemCheckoutCubit>().fetchItemsOrder();
            // context.read<LocationCubit>().getLocation();
            if (state.uiState.isSuccess && state.cart?.totalItem == 0) {
              context.pop();
            }
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpaceHorizontal(size: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TileCard(
                            titleHeader: "Penerima",
                            title: "John Doe",
                            subtitle: "08123455757",
                            leading: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.grey),
                            )),
                      ),
                      const SpaceVertical(size: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: BlocBuilder<LocationCubit, LocationState>(
                          builder: (context, state) {
                            return TileCard(
                              titleHeader: 'Lokasi Antar',
                              leading: SvgIcon(Assets.icPinPoint,color: Theme.of(context).colorScheme.primary),
                              title: state.location?.title ?? "",
                              subtitle: state.location?.address ?? "",
                            );
                          },
                        ),
                      ),
                      const SpaceVertical(size: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Tips(
                          message: 'Estimasi pengiriman 09:00 - 12:00',
                          status: TipsStatus.info,
                        ),
                      ),
                      const SpaceVertical(size: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Card(
                          elevation: 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Header(
                                title: "Pesanan",
                                isShowTapMore: true,
                                actionLabel: "Tambah",
                                onTapMore: () {
                                  context.pop();
                                },
                                child: BlocBuilder<ItemCheckoutCubit,
                                    ItemCheckoutState>(
                                  builder: (context, state) {
                                    if (state.uiState.isSuccess) {
                                      context
                                          .read<SummaryCubit>()
                                          .getSummaryOrder();
                                      return ShoppingCart(
                                        cartItems: state.products,
                                      );
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: ShimmerDefault(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const RoundedPlaceHolder(
                                                width: 70, height: 70),
                                            const SpaceHorizontal(size: 16),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RoundedPlaceHolder(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    height: 16),
                                                const SpaceVertical(size: 4),
                                                const RoundedPlaceHolder(
                                                    width: 120, height: 14),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )),
                          ),
                        ),
                      ),
                      const SpaceVertical(size: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Card(
                          elevation: 0.5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Header(
                              title: "Rincian Harga",
                              isShowTapMore: false,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: PricingDetail(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SpaceVertical(size: 24),
                    ],
                  ),
                ),
              ),
              const Checkout(),
            ],
          )),
    );
  }
}

class TileCard extends StatelessWidget {
  const TileCard({
    super.key,
    required this.titleHeader,
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  final String titleHeader;
  final String title;
  final String subtitle;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Header(
              title: titleHeader,
              isShowTapMore: true,
              actionLabel: "Edit",
              onTapMore: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        leading,
                        const SpaceHorizontal(size: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.onSurface)),
                              Text(subtitle,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
