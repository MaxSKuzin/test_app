import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/repository.dart';
import 'package:test_task/test_app/cubit/enums.dart';
import 'package:test_task/test_app/cubit/meal_cubit/meal_list_cubit.dart';
import 'package:test_task/test_app/models/meal.dart';
import 'package:test_task/test_app/models/restaurant.dart';
import 'package:test_task/test_app/widgets/meal_list_item.dart';

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
      body: BlocProvider<MealListCubit>(
        create: (_) => MealListCubit(
          repository: context.read<Repository>(),
        )..fetchList(restaurant.id),
        child: MealsView(),
      ),
    );
  }
}

class MealsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MealListCubit>().state;
    switch (state.status) {
      case ListStatus.falture:
        return const Center(
          child: Text('Something gone wrong'),
        );
      case ListStatus.success:
        return MealListView(state.items);
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
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
  var _index = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: 40,
          child: ListView.builder(
            itemBuilder: (_, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _index = index;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: const EdgeInsets.all(5),
                    color: (_index == index)
                        ? Theme.of(context).colorScheme.secondary
                        : null,
                    child: FittedBox(
                      child: Text(
                        '${MealCategoryToString(MealCategory.values[index])}',
                        style: TextStyle(
                          color: (_index == index) ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            itemCount: MealCategory.values.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
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
    );
  }
}
