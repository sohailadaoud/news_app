import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category/CategoryCubit/states.dart';
import 'package:news_app/repository/source/datasource/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';
import 'package:news_app/repository/source/source_repository_contract.dart';

class CategoryDetailsViewModelCubit extends Cubit<SourceState> {
  late SourceRepositoryContract repositoryContract;
  late SourceRemoteDataSource remoteDataSource;
  late ApiManager apiManager;

  CategoryDetailsViewModelCubit() : super(SourceInitialState()) {
    apiManager = ApiManager();
    remoteDataSource = SourceRemoteDataSourceImpl(apiManager: apiManager);
    repositoryContract =
        SourceRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  void getSourceByCategoryId(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await repositoryContract.getSources(categoryId);

      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message));
      } else {
        emit(SourceSuccessState(sourceList: response!.sources));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: 'error loading sources'));
    }
  }
}
