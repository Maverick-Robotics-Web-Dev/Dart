import 'package:e_commerce_valamy/src/presentation/widgets/categories.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/offers_carousel.dart';
import 'package:flutter/material.dart';

class CarouselCustom extends StatelessWidget {
  const CarouselCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OffersCarousel(),
        const SizedBox(height: 16.0 / 2),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Categories(),
      ],
    );
  }
}
