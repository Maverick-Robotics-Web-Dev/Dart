import 'package:flutter/material.dart';

class RateBar extends StatelessWidget {
  final int star;
  final double value;
  final Color color;

  const RateBar({
    super.key,
    required this.star,
    required this.value,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: star == 1 ? 0 : 16 / 2),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              "$star Star",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
          ),
          const SizedBox(width: 16 / 2),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: LinearProgressIndicator(
                minHeight: 6,
                color: color,
                backgroundColor: Theme.of(
                  context,
                ).textTheme.bodyLarge!.color!.withOpacity(0.05),
                value: value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
