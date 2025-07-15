import 'package:amazon/features/show_news/data/model/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsOverviewTile extends StatelessWidget {
  final NewsModel news;

  const NewsOverviewTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: <Widget>[
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              news.imageUrl,
              height: 300,
              width: 225,
              fit: BoxFit.fill,
            ),
          ),

          // Title and Navigate
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(news.title),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.arrow_up_right,
                  // color: ,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
