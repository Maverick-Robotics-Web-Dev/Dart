import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/product_availability_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductInfo extends StatelessWidget {
  final String title, brand, description;
  final double rating;
  final int numOfReviews;
  final bool isAvailable;

  const ProductInfo({
    super.key,
    required this.title,
    required this.brand,
    required this.description,
    required this.rating,
    required this.numOfReviews,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              brand.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16 / 2),
            Text(
              title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ProductAvailabilityTag(isAvailable: isAvailable),
                const Spacer(),
                SvgPicture.asset("assets/icons/Star_filled.svg"),
                const SizedBox(width: 16 / 4),
                Text("$rating ", style: Theme.of(context).textTheme.bodyLarge),
                Text("($numOfReviews Reviews)"),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Product info",
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16 / 2),
            Text(description, style: const TextStyle(height: 1.4)),
            const SizedBox(height: 16 / 2),
          ],
        ),
      ),
    );
  }
}
