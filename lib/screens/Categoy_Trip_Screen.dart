import 'package:flutter/material.dart';
import 'package:travel_app/model/Categories_Trip_Data.dart';
import 'package:travel_app/widget/TripCard.dart';

import '../Data.dart';

class CategoryTrip extends StatefulWidget {
  const CategoryTrip({
    Key? key,
    required this.availableTrips,
  }) : super(key: key);
  static const screenRoute = '/CategoryTrip';
  final List<Trip> availableTrips;
  @override
  State<CategoryTrip> createState() => _CategoryTripState();
}

class _CategoryTripState extends State<CategoryTrip> {
  late var categoryTitle;
  late List<Trip> displayTrips;
  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'];
    categoryTitle = routeArguments['title'];
    displayTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: ((cnx, index) {
          return TripCard(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            duration: displayTrips[index].duration,
            // removeTrip: _removeTrip,
          );
        }),
        itemCount: displayTrips.length,
      ),
    );
  }
}
