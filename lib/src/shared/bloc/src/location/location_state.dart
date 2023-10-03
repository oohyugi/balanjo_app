part of 'location_cubit.dart';

@immutable
class LocationState extends Equatable {
  final SimpleUiState uiState;
  final LocationModel? selectedLocation;
  final LocationModel? location;

  const LocationState._({
    this.uiState = SimpleUiState.initial,
    this.location,
    this.selectedLocation,
  });

  const LocationState.initial() : this._();

  const LocationState.success(
      {LocationModel? location, LocationModel? selectedLocation})
      : this._(
            uiState: SimpleUiState.success,
            location: location,
            selectedLocation: selectedLocation);

  const LocationState.failure() : this._(uiState: SimpleUiState.failure);


  @override
  List<Object?> get props => [uiState, location];
}
