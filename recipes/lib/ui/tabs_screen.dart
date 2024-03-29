import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/recipe.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import './widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> categories;
  final Set<Recipe> favorites;
  final Function toggleFavorite;

  TabsScreen(this.categories, this.favorites, this.toggleFavorite);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _ScreenItem {
  final Widget screen;
  final String title;

  const _ScreenItem(this.screen, this.title);
}

class _TabsScreenState extends State<TabsScreen> {
  List<_ScreenItem> _screens;
  int _selectedScreen = 0;
  Set<Recipe> _favorites;

  @override
  void initState() {
    super.initState();
    _favorites = widget.favorites;
    _screens = [
      _ScreenItem(CategoriesScreen(widget.categories), 'Categories'),
      _ScreenItem(
        FavoritesScreen(_favorites, widget.toggleFavorite),
        'Favorites',
      ),
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes: ${_screens[_selectedScreen].title}'),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreen].screen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
