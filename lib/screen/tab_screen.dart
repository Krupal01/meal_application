import 'package:flutter/material.dart';
import 'package:meal_application/screen/category_screen.dart';
import 'package:meal_application/screen/favorites_screen.dart';
import 'package:meal_application/widget/main_drawer.dart';

import '../model/meals.dart';

class TabScreen extends StatefulWidget {
  static const route = '/';
  final List<Meal> favoriteMeals;
  const TabScreen({Key? key,  required this.favoriteMeals}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPage = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoryScr(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScr(favoriteMeals: widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int pageNumber) {
    setState(() {
      _selectedPage = pageNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title'].toString()),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPage]['page'] as Widget?,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.category),backgroundColor: Theme.of(context).primaryColor,label: "Categories",),
          BottomNavigationBarItem(icon: const Icon(Icons.favorite),backgroundColor: Theme.of(context).primaryColor,label: "Favorites",),
        ],
      ),
    );
  }
}
