part of 'restaurant_list_cubit.dart';

class RestaurantListState extends Equatable {
  final ListStatus status;
  final List<Restaurant> items;

  const RestaurantListState._({
    this.status = ListStatus.loading,
    this.items = const <Restaurant>[],
  });

  const RestaurantListState.loading() : this._();

  const RestaurantListState.success(List<Restaurant> items)
      : this._(items: items, status: ListStatus.success);

  const RestaurantListState.faiture() : this._(status: ListStatus.falture);

  @override
  List<Object?> get props => [status, items];
}
