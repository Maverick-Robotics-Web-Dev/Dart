import 'package:e_commerce_valamy/src/presentation/widgets/list_tile/divider_list_tile.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0 / 2),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Recent Searches",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        DividerListTileWithText(
          text: "Preferences",
          svgSrc: "assets/icons/Clock.svg",
          press: () {
            Navigator.pushNamed(context, 'preferencesScreenRoute');
          },
        ),
        DividerListTileWithText(
          text: "Preferences",
          svgSrc: "assets/icons/Clock.svg",
          press: () {
            Navigator.pushNamed(context, 'preferencesScreenRoute');
          },
        ),
      ],
    );
  }
}
