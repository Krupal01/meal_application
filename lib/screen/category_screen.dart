import 'package:flutter/material.dart';
import 'package:meal_application/model/dummy_data.dart';
import '../widget/category_widget.dart';
class CategoryScr extends StatelessWidget {
  static const route = '/category_route';
  const CategoryScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200 , 
        childAspectRatio: 3/2 , 
        mainAxisSpacing: 20 , 
        crossAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((e) => CategoryItem(id: e.id, title: e.title , color: e.color,)).toList(),
    );
  }
}
