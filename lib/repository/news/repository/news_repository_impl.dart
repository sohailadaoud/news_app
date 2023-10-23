import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/repository/news/datasource/news_data_source.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';

class NewsRepositoryImpl implements NewsRepositoryContract {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return remoteDataSource.getNews(sourceId);
  }
}
