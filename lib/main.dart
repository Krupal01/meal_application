import 'package:flutter/material.dart';
import 'package:meal_application/screen/category_meals_screen.dart';
import 'package:meal_application/screen/category_screen.dart';
import 'package:meal_application/screen/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        CategoryMealsScr.route : (context) => const CategoryMealsScr(),
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



