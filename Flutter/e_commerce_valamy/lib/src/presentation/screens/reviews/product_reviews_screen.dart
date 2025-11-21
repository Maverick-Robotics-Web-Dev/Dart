import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<DropdownMenuItem> items = [
  DropdownMenuItem(value: "most", label: "Most useful"),
  DropdownMenuItem(value: "recent", label: "Recent"),
];

class ProductReviewsScreen extends StatefulWidget {
  const ProductReviewsScreen({super.key});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  String selected = "most";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: BackButton(),
        ),
        title: Text(
          'Reviews',
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            // fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ReviewCard(
                rating: 4.3,
                numOfReviews: 128,
                numOfFiveStar: 80,
                numOfFourStar: 30,
                numOfThreeStar: 5,
                numOfTwoStar: 1,
                numOfOneStar: 4,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Divider(height: 1),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'productReviewsScreenRoute');
                  },
                  minLeadingWidth: 24,
                  leading: SvgPicture.asset(
                    'assets/icons/Chat-add.svg',
                    height: 30,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  title: Text(
                    'Add Review',
                    style: TextStyle(color: primaryColor, fontSize: 18),
                  ),
                  trailing: SvgPicture.asset(
                    "assets/icons/miniRight.svg",
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
                Divider(height: 1),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Row(
                children: [
                  Text(
                    'User Reviews',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  DropdownButton(items: items, onChanged: onChanged),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
