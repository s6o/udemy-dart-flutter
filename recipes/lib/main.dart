import 'package:flutter/material.dart';

void main() => runApp(RecipesApp());

class RecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: _RecipesScreen(title: 'Recipes'),
    );
  }
}

class _RecipesScreen extends StatefulWidget {
  _RecipesScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<_RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Recipes Screen'),
      ),
    );
  }
}
