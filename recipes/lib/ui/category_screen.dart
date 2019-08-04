import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String id;
  final String title;

  CategoryScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes: ${this.title}'),
      ),
      body: Center(
        child: Text('Categories'),
      ),
    );
  }
}
