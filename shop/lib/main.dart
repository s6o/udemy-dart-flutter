import 'package:flutter/material.dart';

import './screen/screen_products_overview.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenProductsOverview(),
    );
  }
}
