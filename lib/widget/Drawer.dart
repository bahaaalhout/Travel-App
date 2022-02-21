// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';

import '../screens/filter_Screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  ListTile buildListTile(
      String title, IconData icon, VoidCallback ontapfunction) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'ElMessiri',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      onTap: ontapfunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 100,
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 25),
          color: Theme.of(context).accentColor,
          child: Text(
            'دليلك السياحي',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildListTile('الرحلات', Icons.card_travel, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('الفلترة', Icons.filter_list, () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.screenRoute);
        }),
      ]),
    );
  }
}
