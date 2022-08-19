import 'package:flutter/material.dart';
import 'package:meal_application/model/meals.dart';

import '../widget/meals_widget.dart';

class CategoryMealsScr extends StatefulWidget {
  static const route = "/category_meals_scr";

  final List<Meal> availableMeals;
  const CategoryMealsScr({Key? key,required this.availableMeals, }) : super(key: key);

  @override
  State<CategoryMealsScr> createState() => _CategoryMealsScrState();
}

class _CategoryMealsScrState extends State<CategoryMealsScr> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = args['title'].toString();
      final categoryId = args['id'].toString();
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
