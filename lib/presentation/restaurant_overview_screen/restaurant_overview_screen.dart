import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/domain/models/restaurant.dart';
import 'package:test_task/domain/restaurant_list_bloc/restaurant_list_bloc.dart';
import 'package:test_task/presentation/restaurant_overview_screen/restaurant_list_item.dart';

class RestaurantOverviewScreen extends StatelessWidget {
  const RestaurantOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Рестораны',
        ),
        centerTitle: true,
      ),
      body: BlocProvider<RestaurantListBloc>(
        create: (context) => RestaurantListBloc()..add(FetchRestaurantList()),
        child: BlocBuilder<RestaurantListBloc, RestaurantListState>(
            builder: (_, state) => RestaurantView(state)),
      ),
    );
  }
}

class RestaurantView extends StatelessWidget {
  final RestaurantListState state;

  const RestaurantView(this.state);
  @override
  Widget build(BuildContext context) {
    if (state is RestaurantListError) {
      return const Center(child: Text('Something went wrong!'));
    } else if (state is RestaurantListReady) {
      return RestaurantListView((state as RestaurantListReady).items);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

class RestaurantListView extends StatelessWidget {
  const RestaurantListView(this.items);

  final List<Restaurant> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Center(
            child: Text('no content'),
          )
        : ListView.builder(
            itemBuilder: (_, index) => RestaurantListItem(item: items[index]),
            itemCount: items.length,
          );
  }
}
