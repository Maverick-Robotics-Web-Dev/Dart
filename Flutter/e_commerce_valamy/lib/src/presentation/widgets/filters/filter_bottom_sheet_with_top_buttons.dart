import 'package:e_commerce_valamy/src/presentation/widgets/filters/buttons/bottom_button_filter_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/buttons/buttons_filter_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/list/filter_list_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/list/sort_list_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/top_bars/top_bar_filter_style_one.dart';
import 'package:flutter/material.dart';

class FilterOption {
  final String title;
  final String? subTitle;
  final List<String>? options;

  FilterOption({required this.title, this.subTitle, this.options});
}

class SortOption {
  final String title;

  SortOption({required this.title});
}

class FilterBottomSheetWithTopButtons extends StatefulWidget {
  final List<FilterOption> filters;
  final List<SortOption> sorts;
  final String centerTitle;
  final String? rightTitle;
  final String? leftButtonText;
  final String? rightButtonText;
  final String? bottomButtonText;
  final String? svgSrc;

  const FilterBottomSheetWithTopButtons({
    super.key,
    required this.filters,
    required this.sorts,
    this.centerTitle = 'Filter',
    this.svgSrc,
    this.rightTitle,
    this.leftButtonText,
    this.rightButtonText,
    this.bottomButtonText,
  });

  @override
  State<FilterBottomSheetWithTopButtons> createState() =>
      _FilterBottomSheetWithTopButtonsState();
}

class _FilterBottomSheetWithTopButtonsState
    extends State<FilterBottomSheetWithTopButtons> {
  String option = 'Filter';

  @override
  Widget build(BuildContext context) {
    final screenHeihgt = MediaQuery.of(context).size.height;

    // void openFilterSheet() async {
    //   final result = await showModalBottomSheet(
    //     context: context,
    //     isScrollControlled: true,
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //     ),
    //     builder: (context) => FilterBottomSheet(),
    //   );

    //   // if (result != null) {
    //   //   setState(() {
    //   //     filters = result;
    //   //   });
    //   // }
    // }

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
            TopBarFilterStyleOne(centerTitle: widget.centerTitle),
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
            if (option == 'Filter')
              FilterListStyleOne(
                filters: widget.filters,
                // press: openFilterSheet,
              ),
            if (option == 'Sort') SortListStyleOne(sorts: widget.sorts),
            if (option == 'Sort') Spacer(),
            if (option == 'Sort') BottomButtonFilterStyleOne(),
          ],
        ),
      ),
    );
  }
}
