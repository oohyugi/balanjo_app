import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import 'button.dart';

class AddCart extends StatelessWidget {
  const AddCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.uiState.isSuccess && state.cart != null) {
          final isInCart = state.cart?.items
                  .any((element) => element.productId == product.id) ??
              false;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    width: 0.8, color: Theme.of(context).colorScheme.primary),
                color: !isInCart
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent),
            child: !isInCart
                ? InkWell(
                    onTap: () => context.read<CartCubit>()..increment(product),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: Center(
                          child: Text(
                        "Add",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      )),
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IncrementButton(
                          onClick: () =>
                              context.read<CartCubit>().decrement(product),
                          isEnable: isInCart,
                          icon: Icons.remove),
                      Expanded(
                        child: SizedBox(
                          width: 24,
                          child: Center(
                            child: Text(
                              "${state.cart?.items.firstWhere((element) => element.productId == product.id).qty}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                      IncrementButton(
                          onClick: () =>
                              context.read<CartCubit>().increment(product),
                          isEnable: state.cart?.items
                                  .firstWhere((element) =>
                                      element.productId == product.id)
                                  .qty !=
                              product.maxQty,
                          icon: Icons.add)
                    ],
                  ),
          );
        }
        return Container();
      },
    );
  }
}
