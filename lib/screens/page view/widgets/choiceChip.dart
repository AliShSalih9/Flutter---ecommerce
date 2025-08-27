import 'package:ecommerce/common/widgets/continar_circular.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class DChoiceChip extends StatelessWidget {
  const DChoiceChip({
    super.key,
    required this.text,
    required this.Selected,
    required this.onSelected,
  });
  final String text;
  final bool Selected;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = DHelperFunction.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? SizedBox() : Text(text),
        selected: Selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: Selected ? Colors.white : null),
        avatar: isColor
            ? DCirculeContinar(
                width: 50,
                height: 50,
                background: DHelperFunction.getColor(text)!,
              )
            : null,
        shape: isColor ? CircleBorder() : null,
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        padding: isColor ? EdgeInsets.all(0) : null,
        selectedColor: isColor ? Colors.transparent : null,
        backgroundColor: isColor ? DHelperFunction.getColor(text) : null,
      ),
    );
  }
}
