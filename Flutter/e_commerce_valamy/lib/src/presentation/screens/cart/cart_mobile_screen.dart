import 'package:e_commerce_valamy/src/presentation/screens/cart/widgets/order_summary.dart';
import 'package:e_commerce_valamy/src/presentation/screens/cart/widgets/review_your_order.dart';
import 'package:flutter/material.dart';

class CartMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const CartMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ReviewYourOrder()),
            SliverToBoxAdapter(child: OrderSummary()),
          ],
        ),
      ),
    );
  }
}
