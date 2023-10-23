import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/source/source_repository_contract.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  //hold data , handle logic
  List<Source>? sourcesList;
  String? errorMessage;

  SourceRepositoryContract repositoryContract;

  CategoryDetailsViewModel({required this.repositoryContract});

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
