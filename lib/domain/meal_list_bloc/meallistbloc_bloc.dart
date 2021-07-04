import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test_task/data/repository/repository.dart';
import 'package:test_task/domain/models/meal.dart';
import 'package:test_task/domain/models/meal_category.dart';

part 'meallistbloc_event.dart';
part 'meallistbloc_state.dart';

class MealListBloc extends Bloc<MealListBlocEvent, MealListBlocState> {
  MealListBloc() : super(MealListBlocInitial());

  @override
  Stream<MealListBlocState> mapEventToState(MealListBlocEvent event) async* {
    if (event is FetchMealList) {
      yield MealListBlocInitial();

      try {
        List<Meal> temp = await _repository.fetchMeals(event.resId);

        temp.forEach((element) {
          _items.add(element);
        });

        List<Meal> sortedItems = await _sortItemsByCategory(0);

        yield MealListBlocReady(items: sortedItems);
      } on Exception {
        yield MealListBlocError();
      }
    } else if (event is SortMealListByCategory) {
      yield MealListBlocInitial();

      try {
        // items = (state as MealListBlocReady).items;
        List<Meal> sortedItems = await _sortItemsByCategory(event.index);

        yield MealListBlocReady(items: sortedItems, categoryIndex: event.index);
      } on Exception {
        yield MealListBlocError();
      }
    }
  }

  final Repository _repository = Repository.instance;

  final _items = <Meal>[];

  Future<List<Meal>> _sortItemsByCategory(int categoryIndex) async {
    return _items
        .where((element) =>
            element.categories.contains(MealCategory.values[categoryIndex]))
        .toList();
  }
}
