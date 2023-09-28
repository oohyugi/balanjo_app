part of 'saved_location_cubit.dart';

@immutable
class SavedLocationState extends Equatable {
  final SimpleUiState uiState;
  final List<LocationModel> locations;

  const SavedLocationState._(
      {this.uiState = SimpleUiState.initial,
      this.locations = const <LocationModel>[]});

  const SavedLocationState.initial() : this._();

  const SavedLocationState.success({required List<LocationModel> locations})
      : this._(uiState: SimpleUiState.success, locations: locations);

  const SavedLocationState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState, locations];
}
