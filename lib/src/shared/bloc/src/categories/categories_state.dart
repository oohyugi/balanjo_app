part of 'categories_cubit.dart';

@immutable
class CategoriesState extends Equatable {
  final SimpleUiState uiState;
  final List<CategoryModel> categories;

  const CategoriesState._(
      {this.uiState = SimpleUiState.initial,
      this.categories = const <CategoryModel>[]});

  const CategoriesState.initial() : this._();

  const CategoriesState.success({required List<CategoryModel> categories})
      : this._(uiState: SimpleUiState.success, categories: categories);

  const CategoriesState.failure() : this._(uiState: SimpleUiState.failure);

  @override
  List<Object?> get props => [uiState, categories];
}
