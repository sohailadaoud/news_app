import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/repository/news/datasource/news_data_source.dart';
import 'package:news_app/repository/news/datasource/news_remote_data_source.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';

class NewsContainerViewModel extends ChangeNotifier {
  // hold data ,handle logic
  List<News>? newsList;
  String? errorMessage;

  late NewsRepositoryContract repositoryContract;
  late NewsRemoteDataSource remoteDataSource;
  late ApiManager apiManager;

  NewsContainerViewModel() {
    apiManager = ApiManager();
    remoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
    repositoryContract = NewsRepositoryImpl(remoteDataSource: remoteDataSource);
  }

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
