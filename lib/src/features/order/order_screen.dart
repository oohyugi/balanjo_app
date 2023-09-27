import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'bloc/bloc.dart';
import 'component/checkout.dart';
import 'component/pricing_detail.dart';
import 'component/shopping_cart.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      isShowFloatingCart: false,
      title: const Text("Konfirmasi Pesanan"),
      body: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            context.read<ItemOrderCubit>().fetchItemsOrder();
            if (state.uiState.isSuccess && state.cart?.totalItem == 0) {
              context.pop();
            }
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Alamat pengiriman belum ada, Silakan tambahkan terlebih dahulu",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                        ),
                      ),
                      const SpaceVertical(size: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                minimumSize: const Size(64, 32),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: () {},
                            child: const Text("Tambah Alamat")),
                      ),
                      const SpaceVertical(size: 16),
                      Header(
                          title: "Keranjang Belanja",
                          isShowTapMore: false,
                          child: BlocBuilder<ItemOrderCubit, ItemOrderState>(
                            builder: (context, state) {
                              if (state.uiState.isSuccess) {
                                context
                                    .read<SummaryOrderCubit>()
                                    .getSummaryOrder();
                                return ShoppingCart(
                                  cartItems: state.products,
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: ShimmerDefault(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const RoundedPlaceHolder(width: 70, height: 70),
                                      const SpaceHorizontal(size: 16),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          RoundedPlaceHolder(
                                              width: MediaQuery.of(context).size.width/2, height: 16),
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
                      const SpaceVertical(size: 24),
                      const Header(
                        title: "Rincian Harga",
                        isShowTapMore: false,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: PricingDetail(),
                        ),
                      )
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
