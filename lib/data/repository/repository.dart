import 'package:test_task/domain/models/meal.dart';
import 'package:test_task/domain/models/restaurant.dart';
import 'package:test_task/domain/models/meal_category.dart';

class Repository {
  Repository._();

  static Repository? _instance;

  static Repository get instance {
    if (_instance == null) {
      _instance = Repository._();
    }

    return _instance!;
  }

  List<Restaurant> _restaurants = [
    Restaurant('c1', 'Бургер Кинг'),
    Restaurant('c2', 'KFC'),
    Restaurant('c3', 'McDonald\'s'),
  ];

  List<Meal> _meals = [
    Meal(
      id: 'm1',
      amount: 189,
      title: 'Комбо с Воппером Дж.',
      imageUrl:
          'https://orderapp-static.burgerking.ru/x512/mobile_image/b4d038b40fd980501fbd5c933a3e11cb.png',
      restaurants: ['c1', 'c2'],
      categories: [
        MealCategory.combo,
        MealCategory.popular,
      ],
    ),
    Meal(
      id: 'm2',
      amount: 300,
      title: '2 Воппер комбо',
      imageUrl:
          'https://orderapp-static.burgerking.ru/x512/mobile_image/dc465925be589596f8677d32e3c01f36.png',
      restaurants: ['c1', 'c3'],
      categories: [
        MealCategory.combo,
        MealCategory.popular,
      ],
    ),
    Meal(
      id: 'm3',
      amount: 199,
      title: 'Любой ролл + Капучино',
      imageUrl:
          'https://orderapp-static.burgerking.ru/x512/mobile_image/15df160d3f2e33dd0e3e41b6058f5561.png',
      restaurants: ['c1', 'c2'],
      categories: [
        MealCategory.combo,
      ],
    ),
    Meal(
      id: 'm4',
      amount: 49,
      title: 'Напиток',
      imageUrl:
          'https://orderapp-static.burgerking.ru/x512/mobile_image/009570a32848a978432451603e054a1a.png',
      restaurants: ['c1', 'c3'],
      categories: [
        MealCategory.single,
        MealCategory.popular,
        MealCategory.drinks,
      ],
    ),
    Meal(
      id: 'm5',
      amount: 49,
      title: 'Стрипс 1 штука',
      imageUrl:
          'https://orderapp-static.burgerking.ru/x512/mobile_image/f8e4c5e6693cc2d83e8b04291e185c19.png',
      restaurants: ['c1', 'c3'],
      categories: [
        MealCategory.single,
      ],
    ),
    Meal(
      id: 'm6',
      amount: 99,
      title: 'Капучино + пирожок',
      imageUrl:
          'https://orderapp-static.burgerking.ru/x512/mobile_image/130d92360e9d9e8c23b2b5602a90014d.png',
      restaurants: ['c1', 'c2'],
      categories: [
        MealCategory.combo,
        MealCategory.popular,
      ],
    ),
  ];

  Future<List<Restaurant>> fetchRestaurants() async {
    return _restaurants;
  }

  Future<List<Meal>> fetchMeals(String resId) async {
    return _meals.where((meal) => meal.restaurants.contains(resId)).toList();
  }
}
