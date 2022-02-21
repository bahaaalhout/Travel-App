// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:travel_app/model/Categories_Trip_Data.dart';
import 'package:travel_app/screens/Trip_Details_Screen.dart';

class TripCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final TripType tripType;
  final Season season;
  final int duration;
  // final Function removeTrip;
  const TripCard({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.tripType,
    required this.season,
    required this.duration,
    // required this.removeTrip
  }) : super(key: key);

  String get seasonText {
    switch (season) {
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
    }
  }

  String get TripText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
        // TODO: Handle this case.
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Activities:
        return 'نشاطات';
        break;
      case TripType.Therapy:
        return 'انشطة';
        break;
      default:
        return 'غير معروف';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      TripDetailsScreen.ScreenRoute,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeTrip(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        elevation: 7,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: [0.6, 1],
                  )),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text('${duration} أيام')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(seasonText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(TripText)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
