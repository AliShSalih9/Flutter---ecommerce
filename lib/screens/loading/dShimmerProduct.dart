import 'package:ecommerce/screens/home/widgets/grid_widget.dart';
import 'package:ecommerce/screens/loading/dShimmerEffect.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class Dshimmerproduct extends StatelessWidget {
  const Dshimmerproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GridWidget(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: Dshimmereffect(width: 280, height: 90),
        );
      },
    );
  }
}
