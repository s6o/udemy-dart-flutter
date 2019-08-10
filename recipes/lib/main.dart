import 'package:flutter/material.dart';

import './routes.dart';
import './ui/tabs_screen.dart';
import './ui/recipe_screen.dart';
import './ui/category_screen.dart';
import './ui/filters_screen.dart';

void main() => runApp(RecipesApp());

class RecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        Routes.root: (ctx) => TabsScreen(),
        Routes.category: (ctx) => CategoryScreen(),
        Routes.recipe: (ctx) => RecipeScreen(),
        Routes.filters: (ctx) => FiltersScreen(),
      },
    );
  }
}
