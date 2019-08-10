import 'package:flutter/material.dart';

import './routes.dart';
import './ui/tabs_screen.dart';
import './ui/recipe_screen.dart';
import './ui/category_screen.dart';
import './ui/filters_screen.dart';

import './models/category.dart';
import './models/recipe.dart';
import './models/dummy_data.dart';

void main() => runApp(RecipesApp());

class RecipesApp extends StatefulWidget {
  @override
  _RecipesAppState createState() => _RecipesAppState();
}

class _RecipesAppState extends State<RecipesApp> {
  List<Category> _categories = DUMMY_CATEGORIES;
  List<Recipe> _recipes = DUMMY_RECIPES;
  Filter _filter;

  @override
  void initState() {
    super.initState();
    _filter = Filter();
  }

  List<Recipe> get _filteredRecipes {
    return _recipes.where((Recipe r) {
      if (_filter.glutenFree && !r.isGlutenFree) return false;
      if (_filter.vegetarian && !r.isVegetarian) return false;
      if (_filter.vegan && !r.isVegan) return false;
      if (_filter.lactoseFree && !r.isLactoseFree) return false;
      return true;
    }).toList();
  }

  List<Category> get _filteredCategories {
    Set<String> remaining = _filteredRecipes
        .map((Recipe r) => r.categories)
        .expand((List<String> cs) => cs)
        .fold(<String>{}, (Set<String> s, String cname) {
      s.add(cname);
      return s;
    });
    return _categories.where((Category c) => remaining.contains(c.id)).toList();
  }

  void _filterUpdater(Filter filter) {
    setState(() {
      _filter = filter;
    });
  }

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
        Routes.root: (ctx) => TabsScreen(_filteredCategories),
        Routes.category: (ctx) => CategoryScreen(_filteredRecipes),
        Routes.recipe: (ctx) => RecipeScreen(),
        Routes.filters: (ctx) => FiltersScreen(_filterUpdater, _filter),
      },
    );
  }
}
