enum Complexity {
  simple,
  challenging,
  hard,
}


class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final Complexity complexity;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.complexity,
    required this.isVegetarian,
  });
}