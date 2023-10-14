import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/myTheme.dart';
import 'package:news_app/news/news_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        //NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
        //'NewsDetails': (context) => NewsDetailsScreen(),
        NewsDetailsScreen.routeName: (context) {
          // Extract the arguments passed to the route
          final News news = ModalRoute.of(context)!.settings.arguments as News;
          // Pass the arguments to the NewsDetailsScreen widget
          return NewsDetailsScreen(news: news);
        },

        //CategoryDetails.routeName: (context) => CategoryDetails(category: category),
        //'category': (context) => CategoryFragment(onCategoryClick: onCategoryClick ),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}
