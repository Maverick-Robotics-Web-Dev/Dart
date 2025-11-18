import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/elevated_button_custom.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/top_bar_custom.dart';
import 'package:flutter/material.dart';

class SizeGuideMobileScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const SizeGuideMobileScreen({super.key, this.textTheme});

  @override
  State<SizeGuideMobileScreen> createState() => _SizeGuideMobileScreenState();
}

class _SizeGuideMobileScreenState extends State<SizeGuideMobileScreen> {
  bool _isShowCentimetersSize = false;

  void updateSizes() {
    setState(() {
      _isShowCentimetersSize = !_isShowCentimetersSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Size in centimeters: $_isShowCentimetersSize');
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TopBarCustom(
              centerTitle: 'Size Guide',
              showRightTitle: false,
              svgSrcRight: 'assets/icons/Share.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButtonCustom(
                  option: _isShowCentimetersSize,
                  textButton: 'Centimeters',
                  press: updateSizes,
                ),
                SizedBox(width: 20),
                ElevatedButtonCustom(
                  option: !_isShowCentimetersSize,
                  textButton: 'Centimeters',
                  press: updateSizes,
                ),
              ],
            ),
          ),
          if (!_isShowCentimetersSize)
            Container(
              // alignment: Alignment.center,
              width: double.infinity,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              // padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: DataTable(
                  columnSpacing: 17,
                  headingRowColor: WidgetStateProperty.all(primaryColor),
                  headingTextStyle: TextStyle(
                    color: whiteColor,
                    // fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  border: TableBorder(
                    horizontalInside: BorderSide(color: Colors.grey, width: 1),
                    verticalInside: BorderSide(color: Colors.grey, width: 1),
                  ),
                  columns: const [
                    DataColumn(
                      label: Text('General Size'),
                      headingRowAlignment: MainAxisAlignment.center,
                    ),
                    DataColumn(
                      label: Text('US Hat Size'),
                      headingRowAlignment: MainAxisAlignment.center,
                    ),
                    DataColumn(
                      label: Text(
                        'Haed\nMeasurement',
                        textAlign: TextAlign.center,
                      ),
                      headingRowAlignment: MainAxisAlignment.center,
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Center(child: Text('S-M'))),
                        DataCell(Center(child: Text('S-M'))),
                        DataCell(Center(child: Text('21 7/8 - 22'))),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Center(child: Text('L-XL'))),
                        DataCell(Center(child: Text('L-XL'))),
                        DataCell(Center(child: Text('22 5/8 - 23'))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          if (_isShowCentimetersSize)
            Container(
              // alignment: Alignment.center,
              width: double.infinity,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              // padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: DataTable(
                  columnSpacing: 17,
                  headingRowColor: WidgetStateProperty.all(primaryColor),
                  headingTextStyle: TextStyle(
                    color: whiteColor,
                    // fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  border: TableBorder(
                    horizontalInside: BorderSide(color: Colors.grey, width: 1),
                    verticalInside: BorderSide(color: Colors.grey, width: 1),
                  ),
                  columns: [
                    DataColumn(
                      label: Text(''),
                      headingRowAlignment: MainAxisAlignment.center,
                    ),
                    DataColumn(
                      label: Text('Size'),
                      headingRowAlignment: MainAxisAlignment.center,
                    ),
                    DataColumn(
                      label: Text('Bust'),
                      headingRowAlignment: MainAxisAlignment.center,
                    ),
                    DataColumn(
                      label: Text('Waist'),
                      headingRowAlignment: MainAxisAlignment.center,
                    ),
                    DataColumn(
                      label: Text('Hips'),
                      headingRowAlignment: MainAxisAlignment.center,
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Center(child: Text('S'))),
                        DataCell(Center(child: Text('2 - 4'))),
                        DataCell(Center(child: Text('32'))),
                        DataCell(Center(child: Text('23 - 25'))),
                        DataCell(Center(child: Text('34 - 35'))),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Center(child: Text('M'))),
                        DataCell(Center(child: Text('6 - 8'))),
                        DataCell(Center(child: Text('34'))),
                        DataCell(Center(child: Text('26 - 27'))),
                        DataCell(Center(child: Text('36 - 39'))),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Center(child: Text('L'))),
                        DataCell(Center(child: Text('9 - 10'))),
                        DataCell(Center(child: Text('36'))),
                        DataCell(Center(child: Text('28 - 30'))),
                        DataCell(Center(child: Text('40 - 42'))),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Center(child: Text('XL'))),
                        DataCell(Center(child: Text('11-12'))),
                        DataCell(Center(child: Text('38'))),
                        DataCell(Center(child: Text('31 - 33'))),
                        DataCell(Center(child: Text('40 - 44'))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Mesaurement Guide',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bust',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Mesaure under your arms at the fullest part of your bust. Be sure to go over your shoulder blades',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Natural Waist',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Mesaure around the narrowest part of your waistline with one forefinger between your body and the measuring taps.',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
