import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/shipping_express_card.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/shipping_rush_card.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/shipping_standard_card.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/shipping_truck_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShippingInformationMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const ShippingInformationMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          surfaceTintColor: whiteColor,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 16),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Arrow - Left.svg',
                height: 30,
                colorFilter: const ColorFilter.mode(
                  primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          title: Text(
            'Shipping methods',
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/Danger Circle.svg',
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ShippingStandardCard(),
                SizedBox(height: 16),
                ShippingExpressCard(),
                SizedBox(height: 16),
                ShippingRushCard(),
                SizedBox(height: 16),
                ShippingTruckCard(),
                SizedBox(height: 16),
                Text(
                  'Mesaure under your arms at the fullest part of your bust. Be sure to go over your shoulder blades',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 16),
                Text(
                  'Mesaure under your arms at the fullest part of your bust. Be sure to go over your shoulder blades',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 16),
                Text(
                  'Mesaure under your arms at the fullest part of your bust. Be sure to go over your shoulder blades',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
