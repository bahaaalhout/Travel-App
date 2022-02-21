// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/screens/categories_Screen.dart';

import '../model/Categories_Trip_Data.dart';
import '../widget/Drawer.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favoritesTrip}) : super(key: key);
  final List<Trip> favoritesTrip;
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;
  @override
  void initState() {
    _screens = [
      {
        'Screen': CategoriesScreen(),
        'title': 'دليل سياحي',
      },
      {
        'Screen': FavoritesScreen(
          favoriteTrips: widget.favoritesTrip,
        ),
        'title': 'الرحلات المفضلة',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(_screens[_selectedScreenIndex]['title'] as String)),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        items: [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
