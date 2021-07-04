import 'package:flutter/material.dart';
import 'package:test_task/presentation/meal_overview_screen/meal_overview_screen.dart';
import 'package:test_task/presentation/restaurant_overview_screen/restaurant_overview_screen.dart';

class App extends MaterialApp {
  App()
      : super(
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                textTheme: TextTheme(
                  title: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                backgroundColor: Colors.black,
              ),
              textTheme: TextTheme(
                title: TextStyle(color: Colors.white, fontSize: 15),
                body1: TextStyle(color: Colors.white),
              ),
              colorScheme: ColorScheme.dark(
                surface: Colors.grey,
                primary: Colors.white,
                secondary: Colors.orange,
              ),
              scaffoldBackgroundColor: Colors.black,
            ),
            routes: {
              HomePage.routeName: (ctx) => const HomePage(),
              MealOverviewScreen.routeName: (ctx) => const MealOverviewScreen(),
            });
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const RestaurantOverviewScreen();
  }
}
