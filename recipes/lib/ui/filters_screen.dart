import 'package:flutter/material.dart';
import './widgets/main_drawer.dart';

enum FilterIndex {
  GlutenFree,
  Vegetarian,
  Vegan,
  LactoseFree,
}

class Filter {
  bool glutenFree;
  bool vegetarian;
  bool vegan;
  bool lactoseFree;

  Filter(
      {this.glutenFree = false,
      this.vegetarian = false,
      this.vegan = false,
      this.lactoseFree = false});

  bool operator [](FilterIndex fi) {
    switch (fi) {
      case FilterIndex.GlutenFree:
        return glutenFree;
        break;
      case FilterIndex.Vegetarian:
        return vegetarian;
        break;
      case FilterIndex.Vegan:
        return vegan;
        break;
      case FilterIndex.LactoseFree:
        return lactoseFree;
        break;
      default:
        return false;
    }
  }

  void operator []=(FilterIndex fi, bool value) {
    switch (fi) {
      case FilterIndex.GlutenFree:
        glutenFree = value;
        break;
      case FilterIndex.Vegetarian:
        vegetarian = value;
        break;
      case FilterIndex.Vegan:
        vegan = value;
        break;
      case FilterIndex.LactoseFree:
        lactoseFree = value;
        break;
    }
  }
}

typedef FilterUpdater = void Function(Filter f);

class FiltersScreen extends StatefulWidget {
  final FilterUpdater filterUpdater;
  final Filter initialFilter;

  FiltersScreen(this.filterUpdater, this.initialFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Filter _filter;

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your recipe selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildFilterSwitch(
                  title: 'Gluten Free',
                  subtitle: 'Only include gluten free recipes',
                  filterIndex: FilterIndex.GlutenFree,
                ),
                _buildFilterSwitch(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian recipes',
                  filterIndex: FilterIndex.Vegetarian,
                ),
                _buildFilterSwitch(
                  title: 'Vegan',
                  subtitle: 'Only include vegan recipes',
                  filterIndex: FilterIndex.Vegan,
                ),
                _buildFilterSwitch(
                  title: 'Lactose Free',
                  subtitle: 'Only include lactose free recipes',
                  filterIndex: FilterIndex.LactoseFree,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSwitch(
      {@required String title,
      @required String subtitle,
      @required FilterIndex filterIndex}) {
    return SwitchListTile(
      title: Text(title),
      value: _filter[filterIndex],
      subtitle: Text(subtitle),
      onChanged: (newValue) {
        setState(() {
          _filter[filterIndex] = newValue;
        });
        widget.filterUpdater(_filter);
      },
    );
  }
}
