import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/filter_bottom_sheet.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/list_tile/divider_list_tile.dart';
import 'package:flutter/material.dart';

class FilterListStyleOne extends StatelessWidget {
  final List<FilterOption> filters;

  const FilterListStyleOne({super.key, required this.filters});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          filters.length,
          (index) => DividerListTileWithSubtitle(
            title: Text(
              filters[index].title,
              style: const TextStyle(
                fontSize: 17,
                color: primaryColor,
                fontWeight: FontWeight.bold,
                // letterSpacing: 1,
              ),
            ),
            subTitle: Text(
              filters[index].subTitle!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
            press: () {},
          ),
        ),
        SizedBox(height: 8),
        CheckboxListTile(
          value: false,
          title: Text(
            'Available in stock',
            style: const TextStyle(
              fontSize: 17,
              color: primaryColor,
              fontWeight: FontWeight.w500,
              // letterSpacing: 1,
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
