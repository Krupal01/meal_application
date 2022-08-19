import 'package:flutter/material.dart';
import 'package:meal_application/model/dummy_data.dart';
import 'package:meal_application/model/meals.dart';
import 'package:meal_application/screen/category_meals_screen.dart';
import 'package:meal_application/screen/category_screen.dart';
import 'package:meal_application/screen/meal_details_screen.dart';
import 'package:meal_application/screen/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.amber),
      ),
      initialRoute: TabScreen.route,
      routes: {
        TabScreen.route: (context) => const TabScreen(),
        CategoryScr.route : (context) => const CategoryScr(),
        CategoryMealsScr.route : (context) => CategoryMealsScr(availableMeals: _availableMeals,),
        MealDetailsScreen.route : (context) => MealDetailsScreen(isFavorite: _isMealFavorite, toggleFavorite: _toggleFavorite)
      },
      onGenerateRoute: (settings) {
        // ignore: avoid_print
        print(settings.arguments);
        return null;
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (ctx) => const CategoryScr(),
        );
      },
    );
  }
}



