import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  //hold data , handle logic
  List<Source>? sourcesList;
  String? errorMessage;

  void getSource(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
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
