enum ListStatus { loading, success, falture }

enum MealCategory {
  popular,
  combo,
  single,
  burgers,
  drinks,
  dietic,
}

String MealCategoryToString(MealCategory category) {
  switch (category) {
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
