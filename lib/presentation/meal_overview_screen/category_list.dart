import 'package:flutter/material.dart';
import 'package:test_task/domain/models/meal_category.dart';
import 'package:test_task/domain/meal_list_bloc/meallistbloc_bloc.dart';

class CategoryList extends StatelessWidget {
  final MealListBlocReady state;
  final MealListBloc bloc;

  const CategoryList(this.state, this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 40,
      child: ListView.builder(
        itemBuilder: (_, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              bloc.add(SortMealListByCategory(index));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                alignment: Alignment.center,
                height: 30,
                padding: const EdgeInsets.all(5),
                color: (state.categoryIndex == index)
                    ? Theme.of(context).colorScheme.secondary
                    : null,
                child: FittedBox(
                  child: Text(
                    '${MealCategory.values[index].categoryToString()}',
                    style: TextStyle(
                      color: (state.categoryIndex == index)
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: MealCategory.values.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
