import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DContinarSearch extends StatelessWidget {
  DContinarSearch({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hint: Text(title),
        prefixIcon: Icon(Iconsax.search_normal),
      ),
    );
  }
}
