import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/myTheme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'news_details';

  final News news;

  //final Uri URL;

  NewsDetailsScreen({required this.news});

  // NewsDetailsScreen({required this.news})
  //     : URL = Uri.parse(news.url ?? 'https://www.google.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            news.title ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  news.urlToImage ?? '',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.fill,
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
                SizedBox(
                  height: 8,
                ),
                Text(
                  news.description ?? '',
                  //textAlign: TextAlign.end,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, color: MyTheme.greyColor),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  news.content ?? '',
                  //textAlign: TextAlign.end,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 14, color: MyTheme.greyColor),
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {
                    launchURL(news.url ?? '');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'View Full Article',
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14, color: MyTheme.greyColor),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

// Future<void> launchURL() async {
//   if (await canLaunch(URL.toString())) {
//     await launch(URL.toString());
//   } else {
//     throw Exception('Could not launch $URL');
//   }
// }
}

// final Uri URL = Uri.parse('https://flutter.dev/');

// Future<void> LaunchURL() async {
//   if (!await launchUrl(URL)) {
//     throw Exception('Could not launch $URL');
//   }
// }

//final Uri URL = Uri.parse('https://flutter.dev/');