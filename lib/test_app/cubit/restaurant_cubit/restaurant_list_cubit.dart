import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/repository.dart';
import 'package:test_task/test_app/cubit/enums.dart';
import 'package:test_task/test_app/models/restaurant.dart';

part 'restaurant_list_state.dart';

class RestaurantListCubic extends Cubit<RestaurantListState> {
  Repository repository;

  RestaurantListCubic({required this.repository})
      : super(const RestaurantListState.loading());

  Future<void> fetchList() async {
    try {
      final items = await repository.fetchRestaurants();
      emit(RestaurantListState.success(items));
    } on Exception {
      emit(const RestaurantListState.faiture());
    }
  }
}
