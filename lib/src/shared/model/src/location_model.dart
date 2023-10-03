import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final double latitude;
  final double longitude;
  final String? address;
  final String? title;

  const LocationModel({
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.address,
    this.title,
  });

 static LocationModel fromJson(Map<String, dynamic> json) {
    return LocationModel(
        latitude: json['latitude'],
        longitude: json['longitude'],
        address: json['address'],
        title: json['title']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['title'] = title;
    return data;
  }

  @override
  List<Object?> get props => [latitude, longitude, address];
}
