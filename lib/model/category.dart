import 'package:flutter/material.dart';
import 'package:news_app/myTheme.dart';

class Category {
  String id;

  String title;

  String imageUrl;

  Color color;

  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.color,
  });

  static List<Category> getCategories() {
// business entertainment general health science sports technology.
    return [
      Category(
          id: 'sports',
          title: 'sports',
          imageUrl: 'assets/images/ball.png',
          color: MyTheme.redColor),
      Category(
          id: 'general',
          title: 'general',
          imageUrl: 'assets/images/Politics.png',
          color: MyTheme.darkBlueColor),
      Category(
          id: 'health',
          title: 'health',
          imageUrl: 'assets/images/health.png',
          color: MyTheme.pinkColor),
      Category(
          id: 'business',
          title: 'business',
          imageUrl: 'assets/images/bussines.png',
          color: MyTheme.brownColor),
      Category(
          id: 'entertainment',
          title: 'entertainment',
          imageUrl: 'assets/images/environment.png',
          color: MyTheme.blueColor),
      Category(
          id: 'science',
          title: 'science',
          imageUrl: 'assets/images/science.png',
          color: MyTheme.yellowColor),
      Category(
          id: 'technology',
          title: 'technology',
          imageUrl: 'assets/images/science.png',
          color: MyTheme.redColor),
    ];
  }
}
