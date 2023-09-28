part of 'summary_cubit.dart';




class SummaryState extends Equatable {
  final SimpleUiState uiState;
  final SummaryOrderMdl? data;

  const SummaryState._({
    this.uiState = SimpleUiState.initial,
    this.data,
  });

  const SummaryState.loading() : this._();

  const SummaryState.success(SummaryOrderMdl data)
      : this._(uiState: SimpleUiState.success, data: data);

  const SummaryState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState,data];
}
