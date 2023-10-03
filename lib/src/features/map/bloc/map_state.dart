part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class OnCameraMove extends MapState {
  late final LatLng latLng;
}

class AddressLoaded extends MapState {
  final LocationModel locationModel;

  AddressLoaded(this.locationModel);
}

class AddressLoading extends MapState {}


