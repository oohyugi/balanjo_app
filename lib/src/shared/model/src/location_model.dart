import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final double latitude;
  final double longitude;
  final String? address;

  const LocationModel(
      {this.latitude = 0.0, this.longitude = 0.0, this.address});

  @override
  List<Object?> get props => [latitude, longitude, address];
}
