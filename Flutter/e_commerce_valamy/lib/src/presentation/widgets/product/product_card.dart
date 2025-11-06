import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/network_image_with_loader.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
    required this.press,
  });
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(140, 220),
        maximumSize: const Size(140, 220),
        padding: const EdgeInsets.all(8),
        side: BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.15,
            child: Stack(
              children: [
                NetworkImageWithLoader(image, radius: 12.0),
                if (dicountpercent != null)
                  Positioned(
                    right: 16.0 / 2,
                    top: 16.0 / 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0 / 2),
                      height: 16,
                      decoration: const BoxDecoration(
                        color: warningColor,
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: Text(
                        "$dicountpercent% off",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0 / 2,
                vertical: 16.0 / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName.toUpperCase(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 10),
                  ),
                  const SizedBox(height: 16.0 / 2),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(fontSize: 12),
                  ),
                  const Spacer(),
                  priceAfetDiscount != null
                      ? Row(
                        children: [
                          Text(
                            "\$$priceAfetDiscount",
                            style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 16.0 / 4),
                          Text(
                            "\$$price",
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      )
                      : Text(
                        "\$$price",
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
