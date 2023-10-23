import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/source/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract {
  SourceRemoteDataSource remoteDataSource;

  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return remoteDataSource.getSources(categoryId);
  }
}
