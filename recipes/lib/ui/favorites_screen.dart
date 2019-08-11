import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../ui/widgets/recipe_item.dart';

class FavoritesScreen extends StatefulWidget {
  final Set<Recipe> favorites;
  final Function toggleFavorite;

  FavoritesScreen(this.favorites, this.toggleFavorite);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Set<Recipe> _favorites;

  @override
  void initState() {
    super.initState();
    _favorites = widget.favorites;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favorites.isEmpty) {
      return Center(child: Text('Favorites'));
    } else {
      var favs = _favorites.toList();
      return Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return RecipeItem(
              favs[index],
              isFavorite: _favorites.contains(favs[index]),
              toggle: widget.toggleFavorite,
            );
          },
          itemCount: favs.length,
        ),
      );
    }
  }
}
