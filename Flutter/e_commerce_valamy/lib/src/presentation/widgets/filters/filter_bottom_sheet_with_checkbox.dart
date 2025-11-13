import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/buttons/bottom_button_filter_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/top_bars/top_bar_filter_style_one.dart';
import 'package:flutter/material.dart';

class FilterBottomSheetWithCheckbox extends StatefulWidget {
  final List<String> filters;
  final String centerTitle;
  final String? rightTitle;
  final String? bottomButtonText;
  final String? svgSrc;

  const FilterBottomSheetWithCheckbox({
    super.key,
    this.centerTitle = 'Filter',
    required this.filters,
    this.rightTitle,
    this.bottomButtonText,
    this.svgSrc,
  });

  @override
  State<FilterBottomSheetWithCheckbox> createState() =>
      _FilterBottomSheetWithCheckboxState();
}

class _FilterBottomSheetWithCheckboxState
    extends State<FilterBottomSheetWithCheckbox> {
  @override
  Widget build(BuildContext context) {
    final screenHeihgt = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        height: screenHeihgt * 0.77,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            TopBarFilterStyleOne(centerTitle: widget.centerTitle),
            ...List.generate(
              widget.filters.length,
              (index) => Column(
                children: [
                  CheckboxListTile(
                    value: false,
                    title: Text(
                      widget.filters[index],
                      style: const TextStyle(fontSize: 18, color: primaryColor),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {},
                  ),
                  Divider(height: 1, color: Colors.grey),
                ],
              ),
            ),
            Spacer(),
            BottomButtonFilterStyleOne(),
          ],
        ),
      ),
    );
  }
}
