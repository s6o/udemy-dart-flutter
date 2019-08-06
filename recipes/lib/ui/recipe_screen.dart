import 'package:flutter/material.dart';

import '../models/recipe.dart';

class RecipeScreen extends StatelessWidget {
  static const routePath = '/recipe';

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.title,
          overflow: TextOverflow.fade,
        ),
      ),
      body: Center(child: Text(recipe.toString())),
    );
  }
}
