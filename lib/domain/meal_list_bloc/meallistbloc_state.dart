part of 'meallistbloc_bloc.dart';

abstract class MealListBlocState {}

class MealListBlocInitial extends MealListBlocState {}

class MealListBlocError extends MealListBlocState {}

class MealListBlocReady extends MealListBlocState {
  final List<Meal> items;
  final int categoryIndex;

  MealListBlocReady({required this.items, this.categoryIndex = 0});
}
