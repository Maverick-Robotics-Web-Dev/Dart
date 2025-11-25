import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/network_image_with_loader.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/switch_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class ProductAddReviewMobileScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const ProductAddReviewMobileScreen({super.key, this.textTheme});

  @override
  State<ProductAddReviewMobileScreen> createState() =>
      _ProductAddReviewMobileScreenState();
}

class _ProductAddReviewMobileScreenState
    extends State<ProductAddReviewMobileScreen> {
  bool isActived = false;

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
          'Add Review',
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
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: NetworkImageWithLoader(
                        'https://i.imgur.com/CGCyp1d.png',
                        radius: 12,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lipsy london'.toUpperCase(),
                              style: TextStyle(
                                color: hintTextColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 16.0 / 2),
                            Text(
                              'Green Poplin Ruched Front',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Divider(color: hintTextColor, height: 1, thickness: 1),
                  SizedBox(height: 18),
                  Text(
                    'Your overall rating of this product',
                    style: TextStyle(
                      color: hintTextColor,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  RatingBar.builder(
                    itemSize: 30,
                    itemPadding: const EdgeInsets.only(right: 16 / 4),
                    unratedColor: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.color!.withOpacity(0.08),
                    glow: false,
                    allowHalfRating: true,
                    onRatingUpdate: (value) {},
                    itemBuilder:
                        (context, index) =>
                            SvgPicture.asset("assets/icons/Star_filled.svg"),
                  ),
                  SizedBox(height: 30),
                  Divider(color: hintTextColor, height: 1, thickness: 1),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set a Title for you review',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(fontSize: 17),
                    decoration: InputDecoration(
                      hintText: 'Summarize review',
                      hintStyle: TextStyle(
                        color: hintTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '100 Character max',
                    style: TextStyle(color: hintTextColor, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What did you like or dislike?',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: TextFormField(
                      // textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      expands: true,
                      // maxLength: 3000,
                      maxLines: null,
                      minLines: null,
                      // maxLines: null,
                      style: TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                        hintText: 'What should shoppers know before?',
                        hintStyle: TextStyle(
                          color: hintTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '3000 Character max',
                    style: TextStyle(color: hintTextColor, fontSize: 13),
                  ),
                  SizedBox(height: 26),
                  Divider(color: hintTextColor, height: 1, thickness: 1),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SwitchWithLabel(
                    text: 'Would you recommend this product?',
                    value: isActived,
                    onChanged: (value) {
                      setState(() {
                        isActived = value;
                      });
                    },
                  ),
                  SizedBox(height: 38),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Submit Review',
                      style: TextStyle(fontSize: 17),
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
