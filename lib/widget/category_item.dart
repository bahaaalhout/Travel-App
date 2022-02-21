import 'package:flutter/material.dart';
import '../screens/Categoy_Trip_Screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.title, required this.imageUrl, required this.id})
      : super(key: key);
  final String title;
  final String id;
  final String imageUrl;
  void SelectGategory(BuildContext cnx) {
    Navigator.of(cnx).pushNamed(
      CategoryTrip.screenRoute,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectGategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ],
      ),
    );
  }
}
