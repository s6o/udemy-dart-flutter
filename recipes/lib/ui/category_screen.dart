import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/recipe.dart';
import '../models/dummy_data.dart';

import './widgets/recipe_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeCategory = ModalRoute.of(context).settings.arguments as Category;
    final filteredRecipes = DUMMY_RECIPES
        .where((Recipe r) => r.categories.contains(routeCategory.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes: ${routeCategory.title}'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return RecipeItem(filteredRecipes[index]);
          },
          itemCount: filteredRecipes.length,
        ),
      ),
    );
  }
}
