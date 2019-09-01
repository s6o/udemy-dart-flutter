import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../provider/provider_products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderProducts>(context);
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: data.items.length,
      itemBuilder: (ctx, index) => ProductItem(data.items[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
