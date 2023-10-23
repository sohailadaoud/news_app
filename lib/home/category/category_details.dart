import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_details_view_model.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';
import 'package:news_app/tabs/tab_container.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category_dettails';

  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel(
      repositoryContract: injectSourceRepositoryContract());

  //CategoryDetailsViewModelCubit viewModel= CategoryDetailsViewModelCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSource(widget.category.id);
                    },
                    child: Text('try again'))
              ],
            );
          } else if (viewModel.sourcesList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return TabContainer(sourcesList: viewModel.sourcesList ?? []);
          }
        },
        //child: Text('header'),
      ),
    );

    // FutureBuilder<SourceResponse?>(
    //     future: ApiManager.getSources(widget.category.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text('SomeThing went wrong'),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getSources(widget.category.id);
    //                   setState(() {});
    //                 },
    //                 child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //       if (snapshot.data?.status != 'ok') {
    //         //error
    //         return Column(
    //           children: [
    //             Text(snapshot.data?.message ?? ''),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getSources(widget.category.id);
    //                   setState(() {});
    //                 },
    //                 child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //       var sourceList = snapshot.data?.sources ?? [];
    //       return TabContainer(sourcesList: sourceList);
    //     });
  }
}
