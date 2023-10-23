import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/repository/news/datasource/news_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse?> getNews(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response;
  }
}

NewsRemoteDataSource injectionNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManager: injectionApiManager());
}

ApiManager injectionApiManager() {
  return ApiManager();
}
