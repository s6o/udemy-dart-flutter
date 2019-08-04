import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryScreen extends StatelessWidget {
  static const routePath = '/category';

  @override
  Widget build(BuildContext context) {
    final routeCategory = ModalRoute.of(context).settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes: ${routeCategory.title}'),
      ),
      body: Center(
        child: Text('Categories'),
      ),
    );
  }
}
