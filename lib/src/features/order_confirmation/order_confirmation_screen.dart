import 'package:balanjo_app/src/features/order_confirmation/bloc/bloc.dart';
import 'package:balanjo_app/src/features/order_confirmation/component/checkout.dart';
import 'package:balanjo_app/src/features/order_confirmation/component/shopping_cart.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/src/utils/extensions/double_ext.dart';
import 'package:balanjo_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'component/pricing_detail.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        isShowFloatingCart: false,
        title: const Text("Konfirmasi Pesanan"),
        body: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state.uiState.isSuccess && state.products.isEmpty) {
              context.pop();
            }
          },
          child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
            if (state.uiState.isSuccess) {
              context.read<SummaryOrderCubit>()
                  .getSummaryOrder(state.products);
              return Column(
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
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onBackground),
                            ),
                          ),
                          const SpaceVertical(size: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(64, 32),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () {},
                                child: const Text("Tambah Alamat")),
                          ),
                          const SpaceVertical(size: 16),
                          Header(
                              title: "Keranjang Belanja",
                              isShowTapMore: false,
                              child: ShoppingCart(
                                cartItems: state.products,
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
              );
            }

            return Container();
          }),
        ));
  }
}
