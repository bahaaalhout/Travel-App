import 'package:flutter/material.dart';

import '../model/Categories_Trip_Data.dart';
import '../widget/TripCard.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key, required this.favoriteTrips})
      : super(key: key);
  final List<Trip> favoriteTrips;
  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(
        child: Text('لا يوجد رحلات مفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((cnx, index) {
          return TripCard(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
            duration: favoriteTrips[index].duration,
            // removeTrip: _removeTrip,
          );
        }),
        itemCount: favoriteTrips.length,
      );
    }
  }
}
