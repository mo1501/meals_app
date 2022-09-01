import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  //

  static const routeName = '/filters';
  final dynamic saveFilters;
  final Map<String?, bool?> currentFilters;

  FilterScreen(this.saveFilters, this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    if (widget.currentFilters['gluten'] != null) {
      glutenFree = widget.currentFilters['gluten'] ?? false;
    }
    if (widget.currentFilters['lactose'] != null) {
      lactoseFree = widget.currentFilters['lactose'] ?? false;
    }
    if (widget.currentFilters['vegetarian'] != null) {
      vegetarian = widget.currentFilters['vegetarian'] ?? false;
      if (widget.currentFilters['Vegan'] != null) {
        vegan = widget.currentFilters['vegan'] ?? false;
      }

      // TODO: implement initState
      super.initState();
    }
  }

    Widget buildSwitctListTile(String title, String description,
        bool currentValue, dynamic updateValue) {
      return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue,
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': glutenFree,
                    'lactose': lactoseFree,
                    'Vegetarian': vegetarian,
                    'Vegan': vegan,
                  };
                  widget.saveFilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection,',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(children: [
                buildSwitctListTile(
                    'Gluten-Free', 'Only include Gluten Free meals', glutenFree,
                    (newValue) {
                  setState(() {
                    glutenFree = newValue;
                  });
                }),
                buildSwitctListTile('Lactose-Free',
                    'Only include Lactose Free meals', lactoseFree, (newValue) {
                  setState(() {
                    lactoseFree = newValue;
                  });
                }),
                buildSwitctListTile(
                    'Vegetarian', 'Only include Vegetarian meals', vegetarian,
                    (newValue) {
                  setState(() {
                    vegetarian = newValue;
                  });
                }),
                buildSwitctListTile('Vegan', 'Only include Vegan meals', vegan,
                    (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                })
              ]),
            ),
          ],
        ),
      );
    }
  }

