import 'package:amazon/features/show_news/domain/entity/news_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final NewsEntity _entity;

  const DetailsScreen({
    super.key,
    required NewsEntity entity,
  }) : _entity = entity, super();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          spacing: 30,
          children: <Widget>[
            // Title
            Text(
              _entity.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                _entity.imageUrl,
                fit: BoxFit.fill,
                height: 500,
              ),
            ),

            // Description
            Text(
              _entity.description,
              style: theme.textTheme.bodyMedium,
            ),

            // Author & Date
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: CupertinoColors.systemGrey6
                      )
                    ),
                    Text(_entity.author)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Published At',
                      style: theme.textTheme.labelSmall?.copyWith(
                          color: CupertinoColors.systemGrey6
                      )
                    ),
                    Text(_entity.publishedAt.toLocal().toString())
                  ],
                )
              ],
            ),
            const Divider(),

            Text(
              _entity.content,
              style: theme.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
