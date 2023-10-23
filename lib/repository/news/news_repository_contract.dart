import 'package:news_app/model/NewsResponse.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse?> getNews(String sourceId);
}
