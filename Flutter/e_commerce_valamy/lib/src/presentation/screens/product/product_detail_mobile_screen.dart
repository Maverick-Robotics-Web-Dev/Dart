import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/top_bar_custom.dart';
import 'package:flutter/material.dart';

class ProductDetailMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const ProductDetailMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBarCustom(centerTitle: 'Product Detail'),
            SizedBox(height: 16),
            Text(
              'Story',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Mesaure under your arms at the fullest part of your bust. Be sure to go over your shoulder blades',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Details',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• Materials: 100% cotton, and lining Structured',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '• Adjustable cotton strap closre',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '• High - quality embroidery stitching',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '• Head circumference: 21" - 24" / 54 - 62 cm',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '• Embroidery stitching',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text('• One size fits most', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Style Notes',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text('Style: Summer Hat', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Design: Plain', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Fabric: Jersey', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
