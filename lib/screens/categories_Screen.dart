// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/Data.dart';
import 'package:travel_app/model/Categories_Data.dart';
import 'package:travel_app/widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 7 / 8,
        ),
        children: CategoriesData.map((e) => CategoryItem(
              title: e.title,
              imageUrl: e.imageUrl,
              id: e.id,
            )).toList());
  }
}
