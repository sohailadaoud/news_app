import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/category/CategoryCubit/states.dart';

class CategoryDetailsViewModelCubit extends Cubit<SourceState> {
  CategoryDetailsViewModelCubit() : super(SourceInitialState());

  void getSourceByCategoryId(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);

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
