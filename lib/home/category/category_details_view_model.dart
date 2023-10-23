import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/source/datasource/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';
import 'package:news_app/repository/source/source_repository_contract.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  //hold data , handle logic
  List<Source>? sourcesList;
  String? errorMessage;

  late SourceRepositoryContract repositoryContract;
  late SourceRemoteDataSource remoteDataSource;
  late ApiManager apiManager;

  CategoryDetailsViewModel() {
    apiManager = ApiManager();
    remoteDataSource = SourceRemoteDataSourceImpl(apiManager: apiManager);
    repositoryContract =
        SourceRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  void getSource(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await repositoryContract.getSources(categoryId);

      //var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        errorMessage = response?.message;
      } else {
        sourcesList = response?.sources;
      }
    } catch (e) {
      errorMessage = 'Error loading source list';
    }
    notifyListeners();
  }
}
