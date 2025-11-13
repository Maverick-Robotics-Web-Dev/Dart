import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/filters/filter_bottom_sheet_with_top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<FilterOption> filters = [
  FilterOption(
    title: 'Color',
    subTitle: 'Seleccionar',
    options: ['Black', 'Blue', 'White', 'Purple', 'Pink', 'Red'],
  ),
  FilterOption(
    title: 'Size',
    subTitle: 'Seleccionar',
    options: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
  ),
  FilterOption(
    title: 'Brand',
    subTitle: 'Seleccionar',
    options: ['Adidas', 'Nike', 'Puma', 'Reebok', 'New Balance'],
  ),
  FilterOption(
    title: 'Price',
    subTitle: 'Seleccionar',
    options: [
      '\$0 - \$50',
      '\$50 - \$100',
      '\$100 - \$200',
      '\$200 - \$500',
      '\$500+',
    ],
  ),
];

List<SortOption> sorts = [
  SortOption(title: 'Price [Low to High]'),
  SortOption(title: 'Price [High to Low]'),
  SortOption(title: 'New'),
  SortOption(title: 'Highest Rated'),
  SortOption(title: 'A-Z'),
  SortOption(title: 'Z-A'),
];

class SearchTopBar extends StatelessWidget {
  const SearchTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    void openFilterSheetWithTopButtons() async {
      final result = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder:
            (context) =>
                FilterBottomSheetWithTopButtons(filters: filters, sorts: sorts),
      );

      // if (result != null) {
      //   setState(() {
      //     filters = result;
      //   });
      // }
    }

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: SvgPicture.asset(
                "assets/logo/Shoplon.svg",
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
                height: 30,
                width: 100,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, mainScreenRoute);
              },
              icon: SvgPicture.asset(
                "assets/icons/Close.svg",
                height: 30,
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 6,
            right: 16,
            left: 16,
            bottom: 10,
          ),
          child: TextField(
            style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
            decoration: InputDecoration(
              fillColor: whiteColor,
              hintText: "Find something...",
              hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              prefixIcon: SvgPicture.asset(
                "assets/icons/Search.svg",
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              prefixIconConstraints: BoxConstraints(maxHeight: 32),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: primaryColor, width: 1.6),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: openFilterSheetWithTopButtons,
                    // onPressed: () async {
                    //   // final result = await showDialogCustom(context: context);
                    // },
                    icon: SvgPicture.asset(
                      "assets/icons/Filter.svg",
                      height: 32,
                      colorFilter: ColorFilter.mode(
                        primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(
                        EdgeInsets.only(right: 10, left: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Recent Searches",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}
