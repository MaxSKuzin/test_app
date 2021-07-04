import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/repository.dart';
import 'package:test_task/test_app/cubit/enums.dart';
import 'package:test_task/test_app/cubit/restaurant_cubit/restaurant_list_cubit.dart';
import 'package:test_task/test_app/models/restaurant.dart';
import 'package:test_task/test_app/widgets/restaurant_list_item.dart';

class RestaurantOverviewScreen extends StatelessWidget {
  const RestaurantOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurants',
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => RestaurantListCubic(
          repository: context.read<Repository>(),
        )..fetchList(),
        child: RestaurantView(),
      ),
    );
  }
}

class RestaurantView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<RestaurantListCubic>().state;
    switch (state.status) {
      case ListStatus.falture:
        {
          return const Center(child: Text('Something went wrong!'));
        }
      case ListStatus.success:
        {
          return RestaurantListView(items: state.items);
        }
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({Key? key, required this.items}) : super(key: key);

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
