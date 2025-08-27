import 'package:flutter/material.dart';

class descProduct extends StatelessWidget {
  const descProduct({super.key, required this.subject, required this.title});
  final String subject;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: subject,

            style: Theme.of(context).textTheme.labelMedium,
          ),
          TextSpan(text: title, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
