import 'package:amazon/features/show_news/domain/entity/news_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsOverviewTile extends StatelessWidget {
  final NewsEntity news;

  const NewsOverviewTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              fit: BoxFit.fill,
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              news.title,
              style: theme.textTheme.bodySmall,
              maxLines: 4,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.arrow_up_right,
                size: 15,
                color: theme.colorScheme.primary,
              ),
            )
          )
        ],
      ),
    );
  }
}
