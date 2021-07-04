part of 'meal_list_cubit.dart';

class MealListState extends Equatable {
  final status;
  final items;

  const MealListState._({
    this.status = ListStatus.loading,
    this.items = const <Meal>[],
  });

  const MealListState.loading() : this._();

  const MealListState.success(List<Meal> items)
      : this._(status: ListStatus.success, items: items);

  const MealListState.falture() : this._(status: ListStatus.falture);

  @override
  List<Object?> get props => [status, items];
}
