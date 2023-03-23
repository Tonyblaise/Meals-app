import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:navigation/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({super.key});
  static const routeName = "/filters";

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen({required this.saveFilters, required this.currentFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters["gluten"]??false;
    _vegeterian = widget.currentFilters["vegeterian"]??false;
    _vegan = widget.currentFilters["vegan"]??false;
    _lactoseFree = widget.currentFilters["lactose"]??false;

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, VoidCallback? updateValue(bool state)) {
    return SwitchListTile.adaptive(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
      //  title: Text("Gluten-Free"),
      // subtitle: Text("Only include fluten_free meals"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> selectedFilters = {
                  "gluten": _glutenFree,
                  "vegeterian": _vegeterian,
                  "vegan": _vegan,
                  "lactose": _lactoseFree,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text("Adjust your meal selection",
              style: Theme.of(context).textTheme.titleMedium),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                "Gluten-Free", "Only include fluten_free meals", _glutenFree,
                (newvalue) {
              setState(() {
                _glutenFree = newvalue;
              });
            }),
            _buildSwitchListTile(
                "Lactose-free", "Only include lactose_free meals", _lactoseFree,
                (newvalue2) {
              setState(() {
                _lactoseFree = newvalue2;
              });
            }),
            _buildSwitchListTile("Vegeterian-free",
                "Only include vegeterian_free meals", _vegeterian, (newvalue3) {
              setState(() {
                _vegeterian = newvalue3;
              });
            }),
            _buildSwitchListTile("Vegan", "Only include vegan meals", _vegan,
                (newvalue4) {
              setState(() {
                _vegan = newvalue4;
              });
            })
          ],
        ))
      ]),
    );
  }

  void updateValue(bool value) {}
}
