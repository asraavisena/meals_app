import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const Filters(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, bool currentVal,
      Function(bool) updateVal) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(description),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  'Gluten free', 'Only include gluten-free meals', _glutenFree,
                  (newVal) {
                setState(() {
                  _glutenFree = newVal;
                });
              }),
              _buildSwitchListTile('Lactose free',
                  'Only include lactose-free meals', _lactoseFree, (newVal) {
                setState(() {
                  _lactoseFree = newVal;
                });
              }),
              _buildSwitchListTile(
                  'Vegan free', 'Only include vegan meals', _vegan, (newVal) {
                setState(() {
                  _vegan = newVal;
                });
              }),
              _buildSwitchListTile('Vegetarian free',
                  'Only include vegatarian meals', _vegetarian, (newVal) {
                setState(() {
                  _vegetarian = newVal;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
