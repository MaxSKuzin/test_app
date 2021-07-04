import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/domain/models/meal.dart';
import 'package:test_task/domain/models/restaurant.dart';
import 'package:test_task/domain/meal_list_bloc/meallistbloc_bloc.dart';

import 'category_list.dart';
import 'meal_list_item.dart';

class MealOverviewScreen extends StatelessWidget {
  const MealOverviewScreen({Key? key}) : super(key: key);

  static const routeName = '/meal_overview_screen';
  @override
  Widget build(BuildContext context) {
    final Restaurant restaurant =
        ModalRoute.of(context)?.settings.arguments as Restaurant;

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: BlocProvider<MealListBloc>(
        create: (_) => MealListBloc()..add(FetchMealList(restaurant.id)),
        child: MealsView(),
      ),
    );
  }
}

class MealsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MealListBloc>().state;
    if (state is MealListBlocError) {
      return const Center(child: Text('Something went wrong'));
    } else if (state is MealListBlocReady) {
      return MealListView(state.items);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

class MealListView extends StatefulWidget {
  final List<Meal> items;

  MealListView(this.items);

  @override
  _MealListViewState createState() => _MealListViewState();
}

class _MealListViewState extends State<MealListView> {
  @override
  Widget build(BuildContext context) {
    MealListBloc bloc = context.read<MealListBloc>();
    return BlocBuilder<MealListBloc, MealListBlocState>(
      builder: (_, state) => Column(
        children: [
          CategoryList(state as MealListBlocReady, bloc),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (_, index) => MealListItem(widget.items[index]),
              itemCount: widget.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
