import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News_App', style: Theme.of(context).textTheme.titleLarge),
      ),
      drawer: Drawer(
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
              title: Text('Categories'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, 'category');
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, 'settings');
              },
            ),
          ],
        ),
      ),
      body: Text('Pick up your category'),
    );
  }
}
