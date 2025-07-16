import 'package:news/features/show_news/domain/entity/news_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsOverviewTile extends StatelessWidget {
  final NewsEntity news;
  final VoidCallback onTap;

  const NewsOverviewTile({super.key, required this.news, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: <Widget>[
            // Image
            Hero(
              tag: news.title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  news.imageUrl,
                  fit: BoxFit.fill,
                ),
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
      ),
    );
  }
}
