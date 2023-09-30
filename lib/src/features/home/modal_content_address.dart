import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/theme/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalContentAddress extends StatelessWidget {
  const ModalContentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Address',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(45, 28),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    icon: svgIcon(context, assetNamePinPoint,width: 16,height: 16),
                    label: Text(
                      "Select on map",
                      style: Theme.of(context).textTheme.labelSmall,
                    ))
              ],
            ),
            BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
              return Text("${state.location?.address}");
            }),
            Flexible(
              child: BlocBuilder<SavedLocationCubit, SavedLocationState>(
                  builder: (context, state) {
                if (state.uiState.isSuccess) {
                  return ListView.separated(
                      itemBuilder: (context, i) =>
                          Text("${state.locations[i].address}"),
                      separatorBuilder: (context, i) => const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Divider(),
                          ),
                      itemCount: state.locations.length);
                }
                return Container();
              }),
            )
          ],
        ),
      ),
    );
  }
}
