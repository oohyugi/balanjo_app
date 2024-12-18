import 'dart:async';

import 'package:balanjo_app/src/features/map/bloc/map_cubit.dart';
import 'package:balanjo_app/src/shared/bloc/bloc.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/res/icons.dart';
import 'package:balanjo_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.initialLocation});

  final LatLng initialLocation;

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  double zoom = 19.0;
  LocationData? currentLocation;
  double scale = 0.0;
  bool isAnimateMarker = false;

  @override
  void initState() {
    _currentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      isShowFloatingCart: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapToolbarEnabled: false,
                  buildingsEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: widget.initialLocation, zoom: zoom),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  onCameraIdle: () {
                    // fetch geocoding
                    context
                        .read<MapCubit>()
                        .fetchAddress(initial: widget.initialLocation);
                    setState(() {
                      isAnimateMarker = false;
                    });
                  },
                  onCameraMove: (pos) {
                    context.read<MapCubit>().onCameraMove(pos.target);
                    setState(() {
                      isAnimateMarker = true;
                    });
                  },
                ),
              ),
              SafeArea(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<MapCubit, MapState>(
                      builder: (context, state) {
                        if (state is AddressLoaded) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.locationModel.title ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.bold),
                              ),
                              const SpaceVertical(size: 12),
                              Expanded(
                                child: Text(state.locationModel.address ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface)),
                              ),
                              const SpaceVertical(size: 24),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: FilledButton(
                                  style: filledLarge(context),
                                  onPressed: () {
                                    context
                                        .read<LocationCubit>()
                                        .setSelectedLocation(
                                            state.locationModel);
                                    context.pop();
                                  },
                                  child: const Text("Konfirmasi"),
                                ),
                              )
                            ],
                          );
                        } else if (state is AddressLoading) {
                          return ShimmerDefault(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const RoundedPlaceHolder(width: 80, height: 18),
                                const SpaceVertical(size: 16),
                                RoundedPlaceHolder(
                                    width: MediaQuery.of(context).size.width,
                                    height: 15),
                                const SpaceVertical(size: 4),
                                RoundedPlaceHolder(
                                    width: MediaQuery.of(context).size.width,
                                    height: 15),
                              ],
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
              bottom: 216,
              right: 16,
              child: IconButton.filledTonal(
                style: IconButton.styleFrom(),
                  onPressed: () {
                    _goToCurrentLocation();
                  },
                  icon: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.my_location_sharp,
                      color: Colors.blue,
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.only(bottom: 242),
            child: Center(
              child: AnimatedContainer(
                
                duration: const Duration(milliseconds: 200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgIcon(
                      Assets.icMarker,
                      width: 46,
                      height: 46,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SpaceVertical(size: isAnimateMarker?14:0),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _currentLocation() async {
    var location = Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {}
  }

  _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    if (currentLocation != null) {
      await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(currentLocation?.latitude ?? 0.0,
              currentLocation?.longitude ?? 0.0),
          zoom: zoom,
        ),
      ));
    }
  }
}
