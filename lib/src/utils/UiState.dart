import 'package:equatable/equatable.dart';

enum UiState { initial, loading, hasData, noData, error }

enum SimplerUiState { success, failure }

enum SimpleUiState { initial, success, failure }

extension UiStateExtension on UiState {
  bool get isLoading => this == UiState.loading;

  bool get isInitial => this == UiState.initial;

  bool get isHasData => this == UiState.hasData;

  bool get isNoData => this == UiState.noData;

  bool get isError => this == UiState.error;
}

extension SimpleUiStateExtension on SimpleUiState {
  bool get isInitial => this == SimpleUiState.initial;

  bool get isSuccess => this == SimpleUiState.success;

  bool get isFailure => this == SimpleUiState.failure;
}

class UiData<T> extends Equatable {
  final UiState state;
  final T? data;
  final String message;

  const UiData._({required this.state, this.data, this.message = ""});

  factory UiData.loaded({T? data}) {
    return UiData._(state: UiState.hasData, data: data);
  }

  factory UiData.error({required String message}) {
    return UiData._(state: UiState.error, message: message);
  }

  factory UiData.loading({String? message}) {
    return UiData._(state: UiState.loading, message: message ?? "");
  }

  factory UiData.initial() {
    return const UiData._(state: UiState.initial);
  }

  factory UiData.noData({required String message}) {
    return UiData._(state: UiState.noData, message: message);
  }

  @override
  List<Object?> get props => [state, data, message];
}
