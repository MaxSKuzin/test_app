import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test_task/data/repository/repository.dart';
import 'package:test_task/domain/models/restaurant.dart';

part 'restaurant_list_event.dart';
part 'restaurant_list_state.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  RestaurantListBloc() : super(RestaurantListInitial());

  final Repository _repository = Repository.instance;

  @override
  Stream<RestaurantListState> mapEventToState(
      RestaurantListEvent event) async* {
    if (event is FetchRestaurantList) {
      yield RestaurantListInitial();

      try {
        List<Restaurant> items = await _repository.fetchRestaurants();

        yield RestaurantListReady(items);
      } on Exception {
        yield RestaurantListError();
      }
    }
  }
}
