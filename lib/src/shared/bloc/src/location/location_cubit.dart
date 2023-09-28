import 'package:balanjo_app/src/shared/data/repository/src/location_repository.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../../../utils/UiState.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.locationRepository) : super(const LocationState.initial());

  final LocationRepository locationRepository;

  void getLocation() async {
    try {
      final allLocations = await locationRepository.getSavedLocations();
      if (allLocations.isNotEmpty) {
        emit(LocationState.success(location: allLocations.last));
      }else {
        _getLocation().then((value) async {
          final isAlreadyInLocal = allLocations.any((element) =>
          element.latitude == value?.latitude &&
              element.longitude == value?.longitude);

          if (!isAlreadyInLocal && value != null) {
            final result = await locationRepository
                .reverse("${value.latitude},${value.longitude}");
            if (result.results.isEmpty) {
              emit(const LocationState.failure());
            } else {
              final location = LocationModel(
                  latitude: value.latitude ?? 0.0,
                  longitude: value.longitude ?? 0.0,
                  address: result.results.firstOrNull?.formattedAddress);
              emit(const LocationState.initial());
              locationRepository.savedLocation(location);
              emit(LocationState.success(location: location));
            }
          }else {
            emit(const LocationState.failure());
          }
        });
      }

    } catch (e) {
      emit(const LocationState.failure());
    }
  }

  void search(String address) {
    final result = locationRepository.search(address);
    _getLocation().then((value) {
      // emit(LocationState.success(location: value));
    });
  }
}

Future<LocationData?> _getLocation() async {
  Location location = Location();
  LocationData locationData;

  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  locationData = await location.getLocation();

  return locationData;
}
