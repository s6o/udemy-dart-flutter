import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './routes.dart';
import './providers/great_places.dart';
import './screens/screen_places_list.dart';
import './screens/screen_add_place.dart';

void main() => runApp(PlacesApp());

class PlacesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amberAccent,
        ),
        home: ScreenPlacesList(),
        routes: {
          Routes.addPlace: (ctx) => ScreenAddPlace(),
        },
      ),
    );
  }
}
