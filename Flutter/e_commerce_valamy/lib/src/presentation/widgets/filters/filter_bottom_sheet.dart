import 'package:e_commerce_valamy/src/presentation/widgets/filters/buttons/bottom_button_filter_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/buttons/buttons_filter_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/list/filter_list_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/list/sort_list_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/top_bars/top_bar_filter_style_one.dart';
import 'package:flutter/material.dart';

class FilterOption {
  final String title;
  final String? subTitle;

  FilterOption(this.title, this.subTitle);
}

class SortOption {
  final String title;

  SortOption(this.title);
}

List<FilterOption> filters = [
  FilterOption('Color', 'Seleccionar'),
  FilterOption('Size', 'Seleccionar'),
  FilterOption('Brand', 'Seleccionar'),
  FilterOption('Price', 'Seleccionar'),
];

List<SortOption> sorts = [
  SortOption('Price [Low to High]'),
  SortOption('Price [High to Low]'),
  SortOption('New'),
  SortOption('Highest Rated'),
  SortOption('A-Z'),
  SortOption('Z-A'),
];

class FilterBottomSheet extends StatefulWidget {
  final String centerTitle;
  final bool isShowButtons;
  final String? rightTitle;
  final String? leftButtonText;
  final String? rightButtonText;
  final String? bottomButtonText;
  final String? svgSrc;

  const FilterBottomSheet({
    super.key,
    this.isShowButtons = true,
    this.centerTitle = 'Filter',
    this.svgSrc,
    this.rightTitle,
    this.leftButtonText,
    this.rightButtonText,
    this.bottomButtonText,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String option = 'Filter';

  @override
  Widget build(BuildContext context) {
    final screenHeihgt = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        height: screenHeihgt * 0.88,
        // padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            TopBarFilterStyleOne(
              centerTitle: widget.centerTitle,
              rightTitle: widget.rightTitle,
              svgSrc: widget.svgSrc,
            ),
            if (widget.isShowButtons)
              ButtonsFilterStyleOne(
                option: option,
                leftButtonText: widget.leftButtonText,
                rightButtonText: widget.rightButtonText,
                onLeftFilterPressed: () {
                  setState(() {
                    option = 'Filter';
                  });
                },
                onRightFilterPressed: () {
                  setState(() {
                    option = 'Sort';
                  });
                },
              ),
            if (option == 'Filter') FilterListStyleOne(filters: filters),
            if (option == 'Sort') SortListStyleOne(sorts: sorts),
            if (option == 'Sort') Spacer(),
            if (option == 'Sort') BottomButtonFilterStyleOne(),
          ],
        ),
      ),
    );
  }
}
