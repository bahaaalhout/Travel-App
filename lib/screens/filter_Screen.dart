// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widget/Drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({required this.saveChanges, required this.currentFilters});
  static const screenRoute = '/filter';
  final Function saveChanges;
  final Map<String, dynamic> currentFilters;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _itisSummer = false;
  var _itisWinter = false;
  var _isforFamilies = false;

  @override
  void initState() {
    _itisSummer = widget.currentFilters['summer'];
    _itisWinter = widget.currentFilters['winter'];
    _isforFamilies = widget.currentFilters['family'];
    super.initState();
  }

  // Widget buildSwitchListTile(
  //   String title,
  //   String subtitle,
  //   var currentvalue,
  //   VoidCallback ontapfunction,
  // ) {
  //   return SwitchListTile(
  //     title: Text(title),
  //     subtitle: Text(subtitle),
  //     value: currentvalue,
  //     onChanged: ontapfunction,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('فلترة'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selecteditem = {
                    'summer': _itisSummer,
                    'winter': _itisWinter,
                    'family': _isforFamilies
                  };
                  widget.saveChanges(selecteditem);
                },
              ),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SwitchListTile(
              title: const Text('الرحلات الصيفية'),
              subtitle: const Text('سيتم اظهار الرحلات الصيفية فقط'),
              value: _itisSummer,
              onChanged: (newvalue) {
                setState(() {
                  _itisSummer = newvalue;
                });
              },
            ),
            SwitchListTile(
              title: const Text('الرحلات الشتوية'),
              subtitle: const Text('سيتم اظهار الرحلات الشتوية فقط'),
              value: _itisWinter,
              onChanged: (newvalue) {
                setState(() {
                  _itisWinter = newvalue;
                });
              },
            ),
            SwitchListTile(
              title: const Text('الرحلات العائلية '),
              subtitle: const Text('سيتم اظهار الرحلات العائلية فقط'),
              value: _isforFamilies,
              onChanged: (newvalue) {
                setState(() {
                  _isforFamilies = newvalue;
                });
              },
            ),
          ],
        ));
  }
}
