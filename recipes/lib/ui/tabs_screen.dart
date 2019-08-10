import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import './widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _ScreenItem {
  final Widget screen;
  final String title;

  const _ScreenItem(this.screen, this.title);
}

class _TabsScreenState extends State<TabsScreen> {
  final List<_ScreenItem> _screens = [
    _ScreenItem(CategoriesScreen(), 'Categories'),
    _ScreenItem(FavoritesScreen(), 'Favorites'),
  ];
  int _selectedScreen = 0;

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
