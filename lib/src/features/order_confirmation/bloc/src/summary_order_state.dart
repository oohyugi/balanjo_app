part of 'summary_order_cubit.dart';




class SummaryOrderState extends Equatable {
  final SimpleUiState uiState;
  final SummaryOrderMdl? data;

  const SummaryOrderState._({
    this.uiState = SimpleUiState.initial,
    this.data,
  });

  const SummaryOrderState.loading() : this._();

  const SummaryOrderState.success(SummaryOrderMdl data)
      : this._(uiState: SimpleUiState.success, data: data);

  const SummaryOrderState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState,data];
}
