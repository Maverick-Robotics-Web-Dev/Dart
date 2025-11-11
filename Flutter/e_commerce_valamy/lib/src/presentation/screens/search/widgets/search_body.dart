import 'package:e_commerce_valamy/src/presentation/widgets/list_tile/divider_list_tile.dart';
import 'package:flutter/material.dart';

class RecentSearchModel {
  final String text;
  final String? svgSrc;

  RecentSearchModel({required this.text, this.svgSrc});
}

List<RecentSearchModel> recentSearches = [
  RecentSearchModel(text: 'Preferences'),
  RecentSearchModel(text: 'Preferences'),
  RecentSearchModel(text: 'Preferences'),
  RecentSearchModel(text: 'Preferences'),
];

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recentSearches.length,
      itemBuilder:
          (context, index) => DividerListTileWithText(
            text: recentSearches[index].text,
            press: () {
              Navigator.pushNamed(context, 'preferencesScreenRoute');
            },
          ),
    );
  }
}
