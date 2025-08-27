import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class DSettingMenuTile extends StatelessWidget {
  const DSettingMenuTile({
    super.key,
    required this.title,
    this.subTitle,
    required this.onTab,
    required this.icon,
    this.traling,
  });
  final String title;
  final String? subTitle;
  final VoidCallback onTab;
  final IconData icon;
  final Widget? traling;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: DColors.primaryColor),
      onTap: onTab,
      title: Text(title, style: Theme.of(context).textTheme.titleSmall),
      subtitle: Text(
        subTitle!,
        style: Theme.of(context).textTheme.labelMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: traling,
    );
  }
}
