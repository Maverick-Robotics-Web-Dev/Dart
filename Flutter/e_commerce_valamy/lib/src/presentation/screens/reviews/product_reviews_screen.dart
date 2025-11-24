import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class MenuItemModel {
  final String value;
  final String label;

  MenuItemModel({required this.value, required this.label});
}

class ReviewCardModel {
  final String imageUrl;
  final String userName;
  final String publishTime;
  final double rating;
  final String description;

  ReviewCardModel({
    required this.imageUrl,
    required this.userName,
    required this.rating,
    required this.description,
    required this.publishTime,
  });
}

List<MenuItemModel> items = [
  MenuItemModel(value: "most", label: "Most useful"),
  MenuItemModel(value: "recent", label: "Recent"),
];

List<ReviewCardModel> reviewCards = [
  ReviewCardModel(
    imageUrl: 'assets/images/no_image_user.png',
    userName: 'Andrew',
    publishTime: '36s ago',
    rating: 3,
    description:
        'Molestiae id magnam odit rerumvoluptatem aliquam laudantium hic. Sunt et ut delectus quaerat incidunt in molestiae accusantium. Quia officia doloribus. Adipisci consequatur est deserunt sit aut quasi eum. Molestiae aspernatur qui consequatur dolores.',
  ),
  ReviewCardModel(
    imageUrl: 'assets/images/scarlett_johansson.jpg',
    userName: 'Scarlet',
    publishTime: '36s ago',
    rating: 5,
    description: """Molestiae id magnam odit rerumvoluptatem
        aliquam laudantium hic. Sunt et ut delectus
        quaerat incidunt in molestiae accusantium. Quia officia doloribus. Adipisci consequatur est deserunt sit aut quasi eum.
        Molestiae aspernatur qui consequatur dolores.""",
  ),
];

class ProductReviewsScreen extends StatefulWidget {
  const ProductReviewsScreen({super.key});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  String? selected = "most";

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
          SliverPersistentHeader(
            pinned: true,
            delegate: _HeaderDelegate(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      'User Reviews',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    DropdownButton(
                      value: selected,
                      icon: SvgPicture.asset(
                        'assets/icons/miniDown.svg',
                        height: 30,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selected = value;
                        });
                      },
                      selectedItemBuilder:
                          (context) =>
                              items.map((item) {
                                return Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Sort.svg',
                                      height: 29,
                                      color:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodyLarge!.color,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      item.label,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                      items:
                          items.map((item) {
                            return DropdownMenuItem(
                              value: item.value,
                              child: Text(item.label),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.color!.withOpacity(0.035),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage(
                                  reviewCards[index].imageUrl,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                reviewCards[index].userName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                reviewCards[index].publishTime,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          RatingBar.builder(
                            initialRating: reviewCards[index].rating,
                            itemSize: 18,
                            itemPadding: const EdgeInsets.only(right: 16 / 4),
                            unratedColor: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.color!.withOpacity(0.08),
                            glow: false,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            onRatingUpdate: (value) {},
                            itemBuilder:
                                (context, index) => SvgPicture.asset(
                                  "assets/icons/Star_filled.svg",
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              childCount: reviewCards.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _HeaderDelegate({required this.child});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 60; // altura de la Row
  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
