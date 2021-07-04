import 'package:flutter/material.dart';
import 'package:test_task/test_app/models/meal.dart';

class MealListItem extends StatelessWidget {
  final Meal item;

  const MealListItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
            ),
            child: Container(
              height: 130,
              width: double.infinity,
              color: Colors.white,
              child: FittedBox(
                child: Image.network(item.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    item.title,
                  ),
                  height: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(child: Text('${item.amount} ₽')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
