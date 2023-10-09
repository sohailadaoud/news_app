import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/category/tab_container.dart';
import 'package:news_app/model/SourceResponse.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = 'category_dettails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News App', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: FutureBuilder<SourceResponse?>(
          future: ApiManager.getSources(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('SomeThing went wrong'),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                ],
              );
            }
            if (snapshot.data?.status != 'ok') {
              //error
              return Column(
                children: [
                  Text(snapshot.data?.message ?? ''),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                ],
              );
            }
            var sourceList = snapshot.data?.sources ?? [];
            return TabContainer(sourcesList: sourceList);
          }),
    );
  }
}
