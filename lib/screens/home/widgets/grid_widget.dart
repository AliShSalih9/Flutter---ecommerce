import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double mainAxisExtent;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final IndexedWidgetBuilder itemBuilder;

  const GridWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = DSizes.gridViewSpacing,
    this.crossAxisSpacing = DSizes.gridViewSpacing,
    this.mainAxisExtent = 288,
    this.physics = const NeverScrollableScrollPhysics(),
    this.shrinkWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
