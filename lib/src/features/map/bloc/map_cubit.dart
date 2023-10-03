import 'package:balanjo_app/src/shared/data/repository/src/location_repository.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this.locationRepository) : super(MapInitial());

  final LocationRepository locationRepository;
  LatLng? latLng;

  void onCameraMove(LatLng newLatLng) {
    latLng = newLatLng;
  }

  void fetchAddress({LatLng? initial}) async {
    emit(AddressLoading());

    final result = await locationRepository.reverse(
        "${latLng?.latitude ?? initial?.latitude} ${latLng?.longitude ?? initial?.longitude}");
    final address = result.results.firstOrNull?.formattedAddress;

    emit(AddressLoaded(LocationModel(
        latitude: latLng?.latitude ?? 0.0,
        longitude: latLng?.longitude ?? 0.0,
        address: result.results.firstOrNull?.formattedAddress,
        title: result
            .results.firstOrNull?.addressComponents.firstOrNull?.longName)));
    logMessage(address);
  }
}
