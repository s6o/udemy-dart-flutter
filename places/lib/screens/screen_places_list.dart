import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes.dart';
import '../providers/great_places.dart';

class ScreenPlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.addPlace);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (ctx, GreatPlaces places, _) {
          return ListView.builder(
            itemCount: places.items.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(places.items[index].image),
                ),
                title: Text(places.items[index].title),
              );
            },
          );
        },
      ),
    );
  }
}
