import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../errors/failure.dart';

class ErrWidget extends StatelessWidget {
  final Failure failure;

  const ErrWidget({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    final errColor = CupertinoColors.destructiveRed;
    final theme = Theme.of(context);

    final statusCode = failure.statusCode ?? 500;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 30,
      children: <Widget>[
        // Icon with status code
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: <Widget>[
            Icon(CupertinoIcons.exclamationmark_bubble, color: errColor),
            Text(
              statusCode.toString(),
              style: theme.textTheme.titleLarge?.copyWith(color: errColor),
            ),
          ],
        ),

        // Text with error message
        Text(
          failure.message,
          style: theme.textTheme.titleLarge?.copyWith(color: errColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
