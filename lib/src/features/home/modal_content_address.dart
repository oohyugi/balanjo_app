import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/shared/component/src/header.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:balanjo_app/src/utils/UiState.dart';
import 'package:balanjo_app/theme/icons.dart';
import 'package:balanjo_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ModalContentAddress extends StatelessWidget {
  const ModalContentAddress(
      {super.key, required this.onTapMap, required this.onTapItem});

  final Function(LocationModel) onTapMap;
  final VoidCallback onTapItem;

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
                  'Alamat Pengiriman',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                BlocBuilder<LocationCubit, LocationState>(
                  builder: (context, state) {
                    return OutlinedButton.icon(
                        style: outLineSmall(),
                        onPressed: () {
                          if (state.uiState.isSuccess && state.location!=null) {
                            onTapMap(state.location!);
                          } else {
                            onTapMap(const LocationModel(latitude:-1.6305338, longitude: 103.605292));
                          }
                        },
                        icon: const SvgIcon(Assets.icPinPoint,
                            width: 16, height: 16),
                        label: Text(
                          "Lihat Peta",
                          style: Theme.of(context).textTheme.labelSmall,
                        ));
                  },
                )
              ],
            ),
            BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
              return LocationTile(
                assetName: Assets.icGps,
                title: "Lokasi saat ini",
                subtitle: state.location?.address ?? "",
                onTap: onTapItem,
              );
            }),
            Flexible(
              child: BlocBuilder<SavedLocationCubit, SavedLocationState>(
                  builder: (context, state) {
                if (state.uiState.isSuccess) {
                  return ListView.separated(
                      itemBuilder: (context, i) => LocationTile(
                            title: state.locations[i].title ?? "",
                            subtitle: state.locations[i].address ?? "",
                            assetName: Assets.icHistory,
                            onTap: onTapItem,
                          ),
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

class LocationTile extends StatelessWidget {
  const LocationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.assetName,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String assetName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tapper(
      onTap: onTap,
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        isThreeLine: false,
        leading: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgIcon(
                assetName,
                color: Theme.of(context).colorScheme.onSecondary,
                height: 16,
                width: 16,
              ),
            )),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
