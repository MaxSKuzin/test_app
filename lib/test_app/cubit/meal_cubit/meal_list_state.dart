part of 'meal_list_cubit.dart';

class MealListState extends Equatable {
  final status;
  final items;
  final MealCategory category;

  const MealListState._(
      {this.status = ListStatus.loading,
      this.items = const <Meal>[],
      this.category = MealCategory.popular});

  const MealListState.loading() : this._();

  const MealListState.success(List<Meal> items, MealCategory category)
      : this._(status: ListStatus.success, items: items, category: category);

  const MealListState.falture() : this._(status: ListStatus.falture);

  @override
  List<Object?> get props => [status, items];
}
