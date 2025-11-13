import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/filter_bottom_sheet_with_top_buttons.dart';
import 'package:flutter/material.dart';

class SortListStyleOne extends StatelessWidget {
  final List<SortOption> sorts;

  const SortListStyleOne({super.key, required this.sorts});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          sorts.length,
          (index) => Column(
            children: [
              CheckboxListTile(
                value: false,
                title: Text(
                  sorts[index].title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: primaryColor,
                    // fontWeight: FontWeight.w500,
                    // letterSpacing: 1,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {},
              ),
              Divider(height: 1, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
