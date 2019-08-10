import 'package:flutter/material.dart';

import '../../routes.dart';

enum DrawerItem { Recipes, Filters }

class MainDrawer extends StatelessWidget {
  void _selectDrawerItem(BuildContext context, DrawerItem drawer) {
    switch (drawer) {
      case DrawerItem.Recipes:
        Navigator.of(context).pushReplacementNamed(Routes.root);
        break;
      case DrawerItem.Filters:
        Navigator.of(context).pushReplacementNamed(Routes.filters);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _drawerItem(
            Icons.restaurant,
            'Recipes',
            () => _selectDrawerItem(context, DrawerItem.Recipes),
          ),
          _drawerItem(
            Icons.settings,
            'Filters',
            () => _selectDrawerItem(context, DrawerItem.Filters),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, Function tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
