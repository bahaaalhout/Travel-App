// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/Data.dart';
import 'package:travel_app/screens/Categoy_Trip_Screen.dart';
import 'package:travel_app/screens/Trip_Details_Screen.dart';
import 'package:travel_app/screens/categories_Screen.dart';
import 'package:travel_app/screens/filter_Screen.dart';
import 'package:travel_app/screens/tabs_Screen.dart';

import 'model/Categories_Trip_Data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filterchange = {
    'summer': false,
    'winter': false,
    'family': false
  };
  List<Trip> availableTrip = Trips_data;
  List<Trip> favoriteTrip = [];
  void _saveChange(Map<String, bool> filterData) {
    setState(() {
      filterData = _filterchange;
      availableTrip.where((trip) {
        if (_filterchange['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filterchange['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filterchange['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorites(String tripId) {
    final existingindex = favoriteTrip.indexWhere((trip) => trip.id == tripId);
    if (existingindex >= 0) {
      setState(() {
        favoriteTrip.removeAt(existingindex);
      });
    } else {
      setState(() {
        favoriteTrip.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorites(String id) {
    return favoriteTrip.any((trip) => trip.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', 'AE'), // English, no country code
        ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: const TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ElMessiri'),
                headline6: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ElMessiri'),
              ),
        ),
        routes: {
          '/': (context) => TabsScreen(
                favoritesTrip: favoriteTrip,
              ),
          CategoryTrip.screenRoute: (cnx) => CategoryTrip(
                availableTrips: availableTrip,
              ),
          TripDetailsScreen.ScreenRoute: (cnx) => TripDetailsScreen(
                _manageFavorites,
                _isFavorites,
              ),
          FilterScreen.screenRoute: (cnx) => FilterScreen(
                saveChanges: _saveChange,
                currentFilters: _filterchange,
              )
        });
  }
}
