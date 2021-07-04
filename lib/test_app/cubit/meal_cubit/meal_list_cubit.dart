import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/repository.dart';
import 'package:test_task/test_app/models/meal.dart';
import '../enums.dart';

part 'meal_list_state.dart';

class MealListCubit extends Cubit<MealListState> {
  Repository repository;

  MealListCubit({required this.repository})
      : super(const MealListState.loading());

  Future<void> fetchList(String resId, MealCategory category) async {
    try {
      final items = await repository.fetchMeals(resId, category);
      emit(MealListState.success(items, category));
    } on Exception {
      emit(const MealListState.falture());
    }
  }
}
