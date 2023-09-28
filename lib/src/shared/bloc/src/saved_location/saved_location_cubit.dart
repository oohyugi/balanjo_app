import 'package:balanjo_app/src/shared/data/repository/src/location_repository.dart';
import 'package:balanjo_app/src/shared/model/model.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../../../utils/UiState.dart';

part 'saved_location_state.dart';

class SavedLocationCubit extends Cubit<SavedLocationState> {
  SavedLocationCubit(this.locationRepository)
      : super(const SavedLocationState.initial());

  final LocationRepository locationRepository;

  void getAll() async {
    final result = await locationRepository.getSavedLocations();
    emit(SavedLocationState.success(locations: result));
  }
}
