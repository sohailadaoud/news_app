import 'package:flutter/material.dart';
import 'package:news_app/myTheme.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SizedBox(
          height: 40,
        ),
        Text(
          'Language',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('language'),
                Icon(Icons.arrow_drop_down, color: MyTheme.primaryLightColor)
              ],
            ),
          ),
        )
      ]),
    );
  }
}
