import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/list_tile/divider_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String option = 'Filter';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/Arrow - Left.svg",
                      height: 30,
                      colorFilter: const ColorFilter.mode(
                        primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'FIlter',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    'Clear All',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            option == 'Filter' ? primaryColor : whiteColor,
                        side: BorderSide(
                          color:
                              option == 'Filter' ? primaryColor : Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          option = 'Filter';
                        });
                      },
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 17,
                          color: option == 'Filter' ? whiteColor : primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            option == 'Sort' ? primaryColor : whiteColor,
                        side: BorderSide(
                          color: option == 'Sort' ? primaryColor : Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          option = 'Sort';
                        });
                      },
                      child: Text(
                        'Sort',
                        style: TextStyle(
                          fontSize: 17,
                          color: option == 'Sort' ? whiteColor : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 16),
            option == 'Filter'
                ? Column(
                  children: [
                    DividerListTileWithSubtitle(
                      title: Text(
                        'Color',
                        style: const TextStyle(
                          fontSize: 17,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 1,
                        ),
                      ),
                      subTitle: Text(
                        'Seleccionar',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      press: () {},
                    ),
                    DividerListTileWithSubtitle(
                      title: Text(
                        'Size',
                        style: const TextStyle(
                          fontSize: 17,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 1,
                        ),
                      ),
                      subTitle: Text(
                        'Seleccionar',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      press: () {},
                    ),
                    DividerListTileWithSubtitle(
                      title: Text(
                        'Brand',
                        style: const TextStyle(
                          fontSize: 17,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 1,
                        ),
                      ),
                      subTitle: Text(
                        'Seleccionar',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      press: () {},
                    ),
                    DividerListTileWithSubtitle(
                      title: Text(
                        'Price',
                        style: const TextStyle(
                          fontSize: 17,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 1,
                        ),
                      ),
                      subTitle: Text(
                        'Seleccionar',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      press: () {},
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
                )
                : Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    CheckboxListTile(
                      value: false,
                      title: Text(
                        'Price [Low to High]',
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
                    CheckboxListTile(
                      value: false,
                      title: Text(
                        'Price [High to Low]',
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
                    CheckboxListTile(
                      value: false,
                      title: Text(
                        'New',
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
                    CheckboxListTile(
                      value: false,
                      title: Text(
                        'Highest Rated',
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
                    CheckboxListTile(
                      value: false,
                      title: Text(
                        'A-Z',
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
                    CheckboxListTile(
                      value: false,
                      title: Text(
                        'Z-A',
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
            if (option == 'Sort') Spacer(),
            if (option == 'Sort')
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {},
                  child: Text('Done', style: TextStyle(fontSize: 17)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
