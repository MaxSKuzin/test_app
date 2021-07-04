import 'package:flutter/material.dart';
import 'package:test_task/domain/models/meal.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
            ),
            // child:
            child: Container(
              color: Colors.white,
              child: Image.network(
                item.imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(
              item.title,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text('${item.amount} ₽'),
          ),
        ],
      ),
    );
  }
}
