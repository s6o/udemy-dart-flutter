import 'package:flutter/material.dart';

import '../../routes.dart';
import '../../models/recipe.dart';

class RecipeItem extends StatefulWidget {
  final Recipe recipe;
  final bool isFavorite;
  final Function toggle;

  RecipeItem(
    this.recipe, {
    this.isFavorite = false,
    @required this.toggle,
  });

  @override
  _RecipeItemState createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  bool _isFavorite;

  void _selectRecipe(BuildContext context) {
    Navigator.of(context)
        .pushNamed(Routes.recipe, arguments: this.widget.recipe);
  }

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectRecipe(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    this.widget.recipe.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 330,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      this.widget.recipe.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${this.widget.recipe.duration.inMinutes} minute' +
                          (this.widget.recipe.duration.inMinutes > 1
                              ? 's'
                              : '')),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(this.widget.recipe.complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(this.widget.recipe.affordabilityText),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                      widget.toggle(widget.recipe);
                    },
                    child: Row(
                      children: <Widget>[
                        if (widget.isFavorite) Icon(Icons.star),
                        if (!widget.isFavorite) Icon(Icons.star_border),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
