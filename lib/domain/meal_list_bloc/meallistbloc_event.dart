part of 'meallistbloc_bloc.dart';

abstract class MealListBlocEvent {}

class FetchMealList extends MealListBlocEvent {
  final String resId;

  FetchMealList(this.resId);
}

class SortMealListByCategory extends MealListBlocEvent {
  final int index;

  SortMealListByCategory(this.index);
}
