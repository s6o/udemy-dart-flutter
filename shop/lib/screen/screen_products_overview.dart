import 'package:flutter/material.dart';

import '../widget/products_grid.dart';

class ScreenProductsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}
