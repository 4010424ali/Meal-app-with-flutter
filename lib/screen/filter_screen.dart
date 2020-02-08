import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filter';
  final Function setFilter;
  final Map<String, bool> currentfilter;

  FilterScreen(this.currentfilter, this.setFilter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegen = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentfilter['gluten'];
    _vegetarian = widget.currentfilter['vegetarian'];
    _vegen = widget.currentfilter['vegen'];
    _lactoseFree = widget.currentfilter['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTitle(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegen': _vegen,
                'vegetarian': _vegetarian,
              };
              widget.setFilter(selectFilter);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTitle(
                  'Gluten Free',
                  'Only Include Gluten Free Food',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Lactose Free Free',
                  'Only Include Lactose Free Food',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Vegetarian Free',
                  'Only Include Vegetarian Free Food',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Vegen Free',
                  'Only Include Vegen Free Food',
                  _vegen,
                  (newValue) {
                    setState(
                      () {
                        _vegen = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
