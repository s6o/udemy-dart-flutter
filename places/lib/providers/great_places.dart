import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';
import '../models/db.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final item = Place(
      id: DateTime.now().toString(),
      title: title,
      image: image,
      location: PlaceLocation(latitude: 0, longitude: 0),
    );
    _items.add(item);
    notifyListeners();
    Db.insert(
      Table.Places,
      {
        'id': item.id,
        'title': item.title,
        'image': item.image.path,
      },
    );
  }

  Future<void> loadPlaces() async {
    List<Map<String, dynamic>> places = await Db.query(Table.Places);
    _items = places
        .map(
          (p) => Place(
            id: p['id'],
            title: p['title'],
            image: File(p['image']),
            location: PlaceLocation(latitude: 0, longitude: 0),
          ),
        )
        .toList();
    notifyListeners();
  }
}
