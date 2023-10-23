import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';

class NewsContainerViewModel extends ChangeNotifier {
  // hold data ,handle logic
  List<News>? newsList;
  String? errorMessage;

  NewsRepositoryContract repositoryContract;

  NewsContainerViewModel({required this.repositoryContract});

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await repositoryContract.getNews(sourceId);

      //var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        errorMessage = response?.message;
      } else {
        newsList = response?.articles;
      }
    } catch (e) {
      errorMessage = 'error loading news list';
    }
    notifyListeners();
  }
}
