import 'dart:async';

import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.initialLocation});

  final LatLng initialLocation;

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  double zoom = 19.0;
  LocationData? currentLocation;

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
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: const Text("Location"),
              )
            ],
          ),
          Positioned(
              bottom: 216,
              right: 16,
              child: IconButton(
                  onPressed: () {
                    _goToCurrentLocation();
                  },
                  icon: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.secondary),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Icon(
                          Icons.my_location_sharp,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      )))),
          Padding(
            padding: const EdgeInsets.only(bottom: 214),
            child: Center(
              child: Icon(
                Icons.location_on_sharp,
                color: Colors.red.shade800,
                size: 46,
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  void _currentLocation() async {
    var location = Location();
    try {
      location.onLocationChanged.listen((event) {
        currentLocation = event;
      });
    } on Exception {}
  }

  _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
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
