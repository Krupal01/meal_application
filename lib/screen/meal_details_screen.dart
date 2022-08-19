import 'package:flutter/material.dart';

import '../model/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const route = '/meal_details_screen';

  final Function toggleFavorite;
  final Function isFavorite;
  const MealDetailsScreen(
      {Key? key, required this.isFavorite, required this.toggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).backgroundColor,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index])),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
