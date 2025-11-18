import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/size_button.dart';
import 'package:flutter/material.dart';

class SelectedSize extends StatelessWidget {
  const SelectedSize({
    super.key,
    required this.sizes,
    required this.selectedIndex,
    required this.press,
  });

  final List<String> sizes;
  final int selectedIndex;
  final ValueChanged<int> press;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "Select Size",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Row(
          children: List.generate(
            sizes.length,
            (index) => Padding(
              padding: EdgeInsets.only(left: index == 0 ? 16 : 16 / 2),
              child: SizeButton(
                text: sizes[index],
                isActive: selectedIndex == index,
                press: () => press(index),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
