import 'package:flutter/material.dart';

import '../models/category.dart';
import './widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;

  CategoriesScreen(this.categories);

  @override
  Widget build(BuildContext context) {
    return _categoryGrid();
  }

  Widget _categoryGrid() {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: categories.map((Category c) => CategoryItem(c)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
