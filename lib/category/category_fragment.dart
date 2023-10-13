import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/model/category.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \n of interests',
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 18),
              itemBuilder: (context, index) {
                return CategoryItem(
                    category: categoriesList[index], index: index);
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
