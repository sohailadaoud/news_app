import 'package:flutter/material.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/myTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        CategoryDetails.routeName: (context) => CategoryDetails(),
        'category': (context) => CategoryDetails()
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}
