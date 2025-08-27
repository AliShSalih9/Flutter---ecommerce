import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DmenuProfile extends StatelessWidget {
  const DmenuProfile({
    super.key,
    required this.title,
    required this.subject,
    this.icon = Iconsax.arrow_right_3,
    required this.onpressed,
  });
  final String title;
  final String subject;
  final IconData icon;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(subject, style: Theme.of(context).textTheme.labelMedium),
        ),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: IconButton(onPressed: onpressed, icon: Icon(icon)),
        ),
      ],
    );
  }
}
