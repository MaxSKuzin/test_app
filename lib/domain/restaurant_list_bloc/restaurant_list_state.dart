part of 'restaurant_list_bloc.dart';

abstract class RestaurantListState {}

class RestaurantListInitial extends RestaurantListState {}

class RestaurantListReady extends RestaurantListState {
  final List<Restaurant> items;

  RestaurantListReady(this.items);
}

class RestaurantListError extends RestaurantListState {}
