import 'dart:convert';

import 'package:balanjo_app/config/env.dart';
import 'package:balanjo_app/src/api/dio/dio_config.dart';
import 'package:balanjo_app/src/shared/data/local/dao/location_dao.dart';
import 'package:balanjo_app/src/shared/data/local/datasource/location_local_datasource.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:dio/dio.dart';

import '../../network/response/geocoding_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocationRepository {
  Future<GoogleGeocodingResponse> search(
    String address, {
    String? bounds,
    String? language,
    String? region,
    String? components,
  });

  Future<GoogleGeocodingResponse> reverse(String latlng);

  Future<List<LocationModel>> getSavedLocations();

  Future<LocationModel?> getSelectedLocation();

  Future<void> savedLocation(LocationModel location);
}

const String _baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json?';

class LocationRepository implements ILocationRepository {
  final LocationLocalDataSource locationLocalDataSource;

  LocationRepository(this.locationLocalDataSource);

  @override
  Future<GoogleGeocodingResponse> search(String address,
      {String? bounds,
      String? language,
      String? region,
      String? components}) async {
    final Map<String, dynamic> query = <String, dynamic>{
      'address': address.replaceAll(' ', '+'),
      'bounds': bounds,
      'language': language,
      'region': region,
      'components': components,
    };
    query.removeWhere((_, dynamic value) => value == null);

    var dio = createDio(baseUrl: _baseUrl);
    final Response<Map<String, dynamic>> response =
        await dio.addGeocodingInterceptors().get<Map<String, dynamic>>(
              "",
              queryParameters: query,
            );
    return GoogleGeocodingResponse.fromJson(response.data!);
  }

  @override
  Future<GoogleGeocodingResponse> reverse(
    String latlng,
  ) async {
    final Map<String, dynamic> query = <String, dynamic>{
      'latlng': latlng,
      'location_type':'ROOFTOP',
      'key': Env.googleApiKey
    };

    query.removeWhere((_, dynamic value) => value == null);
    var dio = createDio(baseUrl: _baseUrl);
    final Response<Map<String, dynamic>> response =
        await addInterceptors(dio: dio, isRequireAuth: false, header: {})
            .get<Map<String, dynamic>>(
      _baseUrl,
      queryParameters: query,
    );

    logMessage("status code ${response.data}");
    return GoogleGeocodingResponse.fromJson(response.data!);
  }

  @override
  Future<List<LocationModel>> getSavedLocations() async {
    final results = await locationLocalDataSource.getAll();

    return results
        .map((e) => LocationModel(
            latitude: e.latitude,
            longitude: e.longitude,
            address: e.address,
            title: e.title))
        .toList();
  }

  @override
  Future<void> savedLocation(LocationModel location) async {
    await locationLocalDataSource.save(LocationDao(
        latitude: location.latitude,
        longitude: location.longitude,
        title: location.title ?? "",
        address: location.address ?? ""));
  }

  @override
  Future<LocationModel?> getSelectedLocation() async {
    // final titleSelected = await getSelectedLocationTitle();
    // if (titleSelected != null) {
    //   final result =
    //       await locationLocalDataSource.getSelectedLocation(titleSelected);
    //   if (result == null) {
    //     return null;
    //   } else {
    //     return LocationModel(
    //         latitude: result.latitude,
    //         longitude: result.longitude,
    //         address: result.address,
    //         title: result.title);
    //   }
    // } else {
    //   return null;
    // }
  }

  Future<LocationModel?> getLastLocation() async {
    final prefs = await SharedPreferences.getInstance();

    final location = prefs.getString('location');
    if (location != null) {
      logMessage("last loc ${json.decode(location)}");
      return LocationModel.fromJson(json.decode(location));
    } else {
      return null;
    }
  }

  Future<void> saveLastLocation(LocationModel location) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('location', json.encode(location));
  }
}
