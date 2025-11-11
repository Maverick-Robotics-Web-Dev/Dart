import 'package:e_commerce_valamy/src/presentation/screens/search/widgets/search_body.dart';
import 'package:e_commerce_valamy/src/presentation/screens/search/widgets/search_top_bar.dart';
import 'package:flutter/material.dart';

class SearchMobileScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const SearchMobileScreen({super.key, this.textTheme});

  @override
  State<SearchMobileScreen> createState() => _SearchMobileScreenState();
}

class _SearchMobileScreenState extends State<SearchMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(222),
        child: SearchTopBar(),
      ),
      body: SafeArea(child: SearchBody()),
    );
  }
}
