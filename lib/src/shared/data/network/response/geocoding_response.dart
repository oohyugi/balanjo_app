/// class that contains search results
/// and Response status
class GoogleGeocodingResponse {
  const GoogleGeocodingResponse._({
    required this.results,
    required this.status,
  });

  /// [GoogleGeocodingResponse] From Json factory
  factory GoogleGeocodingResponse.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingResponse._(
        status: json['status'] as String? ?? '',
        results: (json['results'] as Iterable<dynamic>?)?.map((dynamic json) =>
                GoogleGeocodingResult.fromJson(json as Map<String, dynamic>)) ??
            <GoogleGeocodingResult>[],
      );

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#results
  final Iterable<GoogleGeocodingResult> results;

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#StatusCodes
  final String status;
}

/// More info at
/// https://developers.google.com/maps/documentation/geocoding/overview#results
class GoogleGeocodingResult {
  const GoogleGeocodingResult._({
    this.addressComponents = const <GoogleGeocodingAddressComponent>[],
    this.formattedAddress = '',
    this.geometry,
    this.placeId = '',
    this.plusCode,
    this.types = const <String>[],
  });

  /// [GoogleGeocodingResult] From Json factory
  factory GoogleGeocodingResult.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingResult._(
        formattedAddress: json['formatted_address'] as String? ?? '',
        geometry: json['geometry'] != null
            ? GoogleGeocodingGeometry.fromJson(
                json['geometry'] as Map<String, dynamic>,
              )
            : null,
        placeId: json['place_id'] as String? ?? '',
        plusCode: json['plus_code'] != null
            ? GoogleGeocodingPlusCode.fromJson(
                json['plus_code'] as Map<String, dynamic>,
              )
            : null,
        addressComponents:
            (json['address_components'] as Iterable<dynamic>?)?.map(
                  (dynamic json) => GoogleGeocodingAddressComponent.fromJson(
                    json as Map<String, dynamic>,
                  ),
                ) ??
                <GoogleGeocodingAddressComponent>[],
        types: (json['types'] as Iterable<dynamic>?)
                ?.map<String>((dynamic json) => json.toString()) ??
            <String>[],
      );

  final Iterable<GoogleGeocodingAddressComponent> addressComponents;
  final String formattedAddress;

  ///
  final GoogleGeocodingGeometry? geometry;

  /// Google Place Id
  final String placeId;

  /// Plust code
  final GoogleGeocodingPlusCode? plusCode;

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#Types
  final Iterable<String> types;
}

class GoogleGeocodingAddressComponent {
  const GoogleGeocodingAddressComponent({
    this.longName = '',
    this.shortName = '',
    this.types = const <String>[],
  });

  /// [GoogleGeocodingAddressComponent] From Json factory
  factory GoogleGeocodingAddressComponent.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingAddressComponent(
        longName: json['long_name'] as String? ?? '',
        shortName: json['short_name'] as String? ?? '',
        types: (json['types'] as Iterable<dynamic>?)
                ?.map<String>((dynamic json) => json.toString()) ??
            <String>[],
      );

  final String longName;
  final String shortName;

  /// All availibles types:
  /// https://developers.google.com/maps/documentation/places/web-service/supported_types
  final Iterable<String> types;
}

class GoogleGeocodingGeometry {
  const GoogleGeocodingGeometry({
    required this.location,
    required this.locationType,
    required this.viewport,
  });

  factory GoogleGeocodingGeometry.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingGeometry(
        location: GoogleGeocodingLocation.fromJson(
          json['location'] as Map<String, dynamic>,
        ),
        locationType: json['location_type'] as String? ?? '',
        viewport: GoogleGeocodingViewport.fromJson(
          json['viewport'] as Map<String, dynamic>,
        ),
      );
  final GoogleGeocodingLocation location;
  final String locationType;

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#Viewports
  final GoogleGeocodingViewport viewport;
}

class GoogleGeocodingLocation {
  const GoogleGeocodingLocation({required this.lat, required this.lng});

  /// [GoogleGeocodingLocation] From Json factory
  factory GoogleGeocodingLocation.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingLocation(
        lat: json['lat'] as double,
        lng: json['lng'] as double,
      );

  /// Latitude
  final double lat;

  /// Longitude
  final double lng;
}

class GoogleGeocodingPlusCode {
  const GoogleGeocodingPlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  /// [GoogleGeocodingPlusCode] From Json factory
  factory GoogleGeocodingPlusCode.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingPlusCode(
        compoundCode: json['compound_code'] as String? ?? '',
        globalCode: json['global_code'] as String? ?? '',
      );

  /// is a 6 character or longer local code with an explicit location
  /// (CWC8+R9, Mountain View, CA, USA). Do not programmatically parse this content.
  final String compoundCode;

  /// is a 4 character area code and 6 character or longer
  /// local code (849VCWC8+R9).
  final String globalCode;
}

class GoogleGeocodingViewport {
  const GoogleGeocodingViewport({
    required this.northeast,
    required this.southwest,
  });

  /// [GoogleGeocodingViewport] From Json factory
  factory GoogleGeocodingViewport.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingViewport(
        northeast: GoogleGeocodingLocation.fromJson(
          json['northeast'] as Map<String, dynamic>,
        ),
        southwest: GoogleGeocodingLocation.fromJson(
          json['southwest'] as Map<String, dynamic>,
        ),
      );

  /// Northeast coordinates
  final GoogleGeocodingLocation northeast;

  /// Southwest coordinates
  final GoogleGeocodingLocation southwest;
}
