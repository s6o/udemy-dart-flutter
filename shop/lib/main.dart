import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/provider_products.dart';
import './screen/screen_products_overview.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => ProviderProducts(),
      child: MaterialApp(
        title: 'Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ScreenProductsOverview(),
      ),
    );
  }
}
