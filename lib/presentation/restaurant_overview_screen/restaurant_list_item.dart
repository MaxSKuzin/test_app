import 'package:flutter/material.dart';
import 'package:test_task/domain/models/restaurant.dart';
import 'package:test_task/presentation/meal_overview_screen/meal_overview_screen.dart';

class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Restaurant item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.restaurant),
          ),
          title: Text(item.title),
          onTap: () {
            Navigator.of(context)
                .pushNamed(MealOverviewScreen.routeName, arguments: item);
          },
        ),
      ),
    );
  }
}
