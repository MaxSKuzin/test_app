import 'package:test_task/domain/models/meal_category.dart';

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final int amount;
  final List<String> restaurants;
  final List<MealCategory> categories;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.amount,
    required this.restaurants,
    required this.categories,
  });
}
