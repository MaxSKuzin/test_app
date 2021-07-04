enum MealCategory {
  popular,
  combo,
  single,
  burgers,
  drinks,
  dietic,
}

extension MealCategoryToString on MealCategory {
  String categoryToString() {
    switch (this) {
      case MealCategory.popular:
        return 'Популярные блюда';
      case MealCategory.combo:
        return 'Комбо';
      case MealCategory.burgers:
        return 'Бургеры';
      case MealCategory.single:
        return 'Единичные';
      case MealCategory.dietic:
        return 'Диетические';
      case MealCategory.drinks:
        return 'Напитки';
    }
  }
}
