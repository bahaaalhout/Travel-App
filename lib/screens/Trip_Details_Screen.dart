// ignore_for_file: constant_identifier_names, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/Data.dart';

class TripDetailsScreen extends StatelessWidget {
  TripDetailsScreen(this.managefavorites, this.isFavorites);
  Function managefavorites;
  Function isFavorites;
  static const ScreenRoute = '/TripDetailScreen';
  Widget buildTripTitle(BuildContext context, String titleText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildCardStyle(Widget child) {
    return Container(
      height: 250,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectTrip = Trips_data.firstWhere(
      (trip) => trip.id == TripId,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(selectTrip.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270,
              width: double.infinity,
              child: Image.network(
                selectTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildTripTitle(context, 'الأنشطة'),
            buildCardStyle(
              ListView.builder(
                itemCount: selectTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Text(
                    selectTrip.activities[index],
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildTripTitle(context, 'البرنامج اليومي'),
            SizedBox(
              height: 10,
            ),
            buildCardStyle(
              ListView.builder(
                itemCount: selectTrip.program.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 25,
                        child: Text(
                          'اليوم ${index + 1}',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      title: Text(
                        selectTrip.program[index],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorites(TripId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => managefavorites(TripId),
      ),
    );
  }
}
