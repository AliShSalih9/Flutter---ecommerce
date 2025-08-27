import 'package:flutter/material.dart';

class headlineTitle extends StatelessWidget {
  const headlineTitle({
    super.key,
    required this.title,
    this.onpressed,
    this.showMoreItem = true,
    this.buttonText,
  });
  final String title;
  final VoidCallback? onpressed;
  final bool showMoreItem;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ?showMoreItem
            ? TextButton(
                onPressed: onpressed,
                child: Text(buttonText ?? 'View All'),
              )
            : null,
      ],
    );
  }
}
