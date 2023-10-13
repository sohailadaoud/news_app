import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.white, // Specify the color here
            ),
            title: Text(
              'Categories',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, 'category');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white, // Specify the color here
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, 'settings');
            },
          ),
        ],
      ),
    );
  }
}
