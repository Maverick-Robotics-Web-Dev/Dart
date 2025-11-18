import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class ProductAvailabilityTag extends StatelessWidget {
  const ProductAvailabilityTag({super.key, required this.isAvailable});

  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16 / 2),
      decoration: BoxDecoration(
        color: isAvailable ? successColor : warningColor,
        borderRadius: const BorderRadius.all(Radius.circular(12 / 2)),
      ),
      child: Text(
        isAvailable ? "Available in stock" : "Currently unavailable",
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
