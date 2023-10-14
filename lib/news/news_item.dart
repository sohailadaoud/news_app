import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/myTheme.dart';
import 'package:news_app/news/news_details_screen.dart';

class NewsItem extends StatelessWidget {
  News news;

  //Function onNewsClick ;

  NewsItem({
    required this.news,
    //required this.onNewsClick
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NewsDetailsScreen.routeName,
                      arguments: news,
                    );
                    //onNewsClick()
                  },
                  child: Image.network(
                    news.urlToImage ?? '',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.fill,
                  ),
                )
                // CachedNetworkImage(
                //   imageUrl : news.urlToImage ??'' ,
                //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),
                ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            news.author ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 14, color: MyTheme.greyColor),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            news.publishedAt ?? '',
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 14, color: MyTheme.greyColor),
          ),
        ],
      ),
    );
  }
}

// Container(
//   clipBehavior: Clip.antiAlias,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(18),
//
//   ),
//   child: Image.network(news.urlToImage??'') ,
// )
