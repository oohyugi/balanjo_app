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

  LocationModel? _selectedLocation;
  LocationModel? _currentLocation;
  LocationData? _locationData;
  Location location = Location();

  // runtime when user change location
  void setSelectedLocation(LocationModel? location) async {
    _selectedLocation = location;
    getSelectedLocation();
  }

  void getSelectedLocation() async {
    if (_selectedLocation == null) {
      // getCurrentLocation
      getLocation();
    } else {
      emit(LocationState.success(
          selectedLocation: _selectedLocation, location: _currentLocation));
    }
  }

  void getLastLocation() async {
    final lastLocation = await locationRepository.getLastLocation();
    if (lastLocation==null) {
      getLocation();
    } else {
      emit(LocationState.success(
          location: lastLocation,
          selectedLocation: _selectedLocation ?? lastLocation));
    }
  }

  // get location
  void getLocation() async {
    _getLocation().then((value) async {
      final result = await locationRepository
          .reverse("${value?.latitude},${value?.longitude}");

      if (result.results.isEmpty) {
        emit(const LocationState.failure());
      } else {
        final location = LocationModel(
          latitude: value?.latitude ?? 0.0,
          longitude: value?.longitude ?? 0.0,
          title: result
              .results.firstOrNull?.addressComponents.firstOrNull?.longName,
          address: result.results.firstOrNull?.formattedAddress,
        );

        //save last location
        locationRepository.saveLastLocation(location);

        emit(LocationState.success(
            location: location, selectedLocation: _selectedLocation));
      }
    });
  }

  void search(String address) {
    final result = locationRepository.search(address);
    _getLocation().then((value) {
      // emit(LocationState.success(location: value));
    });
  }

  Future<LocationData?> _getLocation() async {
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

    _locationData = await location.getLocation();

    return _locationData;
  }
}
