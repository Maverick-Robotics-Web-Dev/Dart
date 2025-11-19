import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/elevated_button_custom.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/rounded_data_table.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/top_bar_custom.dart';
import 'package:flutter/material.dart';

class SizeGuideHead {
  final String name;

  SizeGuideHead({required this.name});
}

class SizeGuideCentimeters {
  final String id;
  final String size;
  final String bust;
  final String waist;
  final String hips;

  SizeGuideCentimeters({
    required this.size,
    required this.bust,
    required this.waist,
    required this.hips,
    this.id = '',
  });
}

class SizeGuideInches {
  final String generalSize;
  final String usHatSize;
  final String headMeasurement;

  SizeGuideInches({
    required this.generalSize,
    required this.usHatSize,
    required this.headMeasurement,
  });
}

List<SizeGuideHead> sizeGuideHeads = [
  SizeGuideHead(name: ''),
  SizeGuideHead(name: 'Size'),
  SizeGuideHead(name: 'Bust'),
  SizeGuideHead(name: 'Waist'),
  SizeGuideHead(name: 'Hips'),
];

List<SizeGuideHead> sizeGuideInchHeads = [
  SizeGuideHead(name: 'General Size'),
  SizeGuideHead(name: 'US Hat Size'),
  SizeGuideHead(name: 'Head\nMeasurement'),
];

List<SizeGuideCentimeters> sizeGuideCentimetersBodies = [
  SizeGuideCentimeters(
    id: 'S',
    size: '2 - 4',
    bust: '32',
    waist: '23 - 25',
    hips: '34 - 35',
  ),
  SizeGuideCentimeters(
    id: 'M',
    size: '6 - 8',
    bust: '34',
    waist: '26 - 27',
    hips: '36 - 39',
  ),
  SizeGuideCentimeters(
    id: 'L',
    size: '9 - 10',
    bust: '36',
    waist: '28 - 30',
    hips: '40 - 42',
  ),
  SizeGuideCentimeters(
    id: 'XL',
    size: '11 - 12',
    bust: '38',
    waist: '31 - 33',
    hips: '40 - 44',
  ),
];

List<SizeGuideInches> sizeGuideInchBodies = [
  SizeGuideInches(
    generalSize: 'S - M',
    usHatSize: 'S - M',
    headMeasurement: '21 7/8 - 22',
  ),
  SizeGuideInches(
    generalSize: 'L - XL',
    usHatSize: 'L - XL',
    headMeasurement: '22 5/8 - 23',
  ),
];

class SizeGuideMobileScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const SizeGuideMobileScreen({super.key, this.textTheme});

  @override
  State<SizeGuideMobileScreen> createState() => _SizeGuideMobileScreenState();
}

class _SizeGuideMobileScreenState extends State<SizeGuideMobileScreen> {
  String _isShowCm = 'Centimeters';

  void updateSizes(String textButton) {
    setState(() {
      _isShowCm = textButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TopBarCustom(
              centerTitle: 'Size Guide',
              showRightButton: true,
              svgSrcRight: 'assets/icons/Share.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RowElevatedButtonCustom(
              leftButtonText: 'Centimeters',
              rightButtonText: 'Inches',
              textCondition: _isShowCm,
              onLeftFilterPressed: () {
                updateSizes('Centimeters');
              },
              onRightFilterPressed: () {
                updateSizes('Inches');
              },
            ),
          ),
          if (_isShowCm == 'Centimeters')
            Padding(
              padding: const EdgeInsets.all(16),
              child: RoundedDataTable<SizeGuideCentimeters>(
                headerColor: primaryColor,
                headerTextColor: whiteColor,
                columnLabels: sizeGuideHeads.map((head) => head.name).toList(),
                items: sizeGuideCentimetersBodies,
                cellBuilder:
                    (sizes) => [
                      DataCell(Center(child: Text(sizes.id))),
                      DataCell(Center(child: Text(sizes.size))),
                      DataCell(Center(child: Text(sizes.bust))),
                      DataCell(Center(child: Text(sizes.waist))),
                      DataCell(Center(child: Text(sizes.hips))),
                    ],
              ),
            ),
          if (_isShowCm == 'Inches')
            Padding(
              padding: EdgeInsets.all(16),
              child: RoundedDataTable<SizeGuideInches>(
                headerColor: primaryColor,
                headerTextColor: whiteColor,
                columnLabels:
                    sizeGuideInchHeads.map((head) => head.name).toList(),
                items: sizeGuideInchBodies,
                cellBuilder:
                    (sizes) => [
                      DataCell(Center(child: Text(sizes.generalSize))),
                      DataCell(Center(child: Text(sizes.usHatSize))),
                      DataCell(Center(child: Text(sizes.headMeasurement))),
                    ],
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
