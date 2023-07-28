part of 'flash_sale_cubit.dart';

class FlashSaleState extends Equatable {
  final SimpleUiState uiState;
  final FlashSaleModel? data;

  const FlashSaleState._({
    this.uiState = SimpleUiState.initial,
    this.data,
  });

  const FlashSaleState.loading() : this._();

  const FlashSaleState.success(FlashSaleModel data)
      : this._(uiState: SimpleUiState.success, data: data);

  const FlashSaleState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState,data];
}
