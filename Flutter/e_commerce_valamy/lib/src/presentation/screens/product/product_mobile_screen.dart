import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/product_buy_now_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/product_detail_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/product_returns_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/shipping_information_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/notify_me_card.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/product_images.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/product_info.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/widgets/product_list_tile.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/card_button.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductMobileScreen extends StatelessWidget {
  final bool isProductAvailable;
  final TextTheme? textTheme;

  const ProductMobileScreen({
    super.key,
    this.textTheme,
    required this.isProductAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          isProductAvailable
              ? CartButton(
                price: 140,
                press: () {
                  customModalBottomSheet(
                    context,
                    height: MediaQuery.of(context).size.height * 0.92,
                    child: ProductBuyNowScreen(),
                  );
                },
              )
              :
              /// If profuct is not available then show [NotifyMeCard]
              NotifyMeCard(isNotify: false, onChanged: (value) {}),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: whiteColor,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/Bookmark.svg",
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ],
            ),
            ProductImages(
              images: [productDemoImg1, productDemoImg2, productDemoImg3],
            ),
            ProductInfo(
              brand: "LIPSY LONDON",
              title: "Sleeveless Ruffle",
              isAvailable: isProductAvailable,
              description:
                  "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
              rating: 4.4,
              numOfReviews: 126,
            ),
            ProductListTile(
              svgSrc: "assets/icons/Product.svg",
              title: "Product Details",
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: ProductDetailScreen(),
                );
              },
            ),
            ProductListTile(
              svgSrc: "assets/icons/Delivery.svg",
              title: "Shipping Information",
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: ShippingInformationScreen(),
                );
              },
            ),
            ProductListTile(
              svgSrc: "assets/icons/Return.svg",
              title: "Returns",
              isShowBottomBorder: true,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: const ProductReturnsScreen(),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ReviewCard(
                  rating: 4.3,
                  numOfReviews: 128,
                  numOfFiveStar: 80,
                  numOfFourStar: 30,
                  numOfThreeStar: 5,
                  numOfTwoStar: 4,
                  numOfOneStar: 1,
                ),
              ),
            ),
            ProductListTile(
              svgSrc: "assets/icons/Chat.svg",
              title: "Reviews",
              isShowBottomBorder: true,
              press: () {
                Navigator.pushNamed(context, productReviewsScreenRoute);
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "You may also like",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder:
                      (context, index) => Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: index == 4 ? 16 : 0,
                        ),
                        child: ProductCard(
                          image: productDemoImg2,
                          title: "Sleeveless Tiered Dobby Swing Dress",
                          brandName: "LIPSY LONDON",
                          price: 24.65,
                          priceAfetDiscount: index.isEven ? 20.99 : null,
                          dicountpercent: index.isEven ? 25 : null,
                          press: () {},
                        ),
                      ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
