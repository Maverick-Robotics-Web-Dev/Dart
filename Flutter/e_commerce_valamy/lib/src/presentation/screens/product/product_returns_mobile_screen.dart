import 'package:flutter/material.dart';

class ProductReturnsMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const ProductReturnsMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16 / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40, child: BackButton()),
                  Text("Return", style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Free pre-paid returns and exchanges for orders shipped to the US. Get refunded faster with easy online returns and print a FREE pre-paid return SmartLabel@ online! Return or exchange any unused or defective merchandise by mail or at one of our US or Canada store locations. Made to order items cannot be canceled, exchange or returned.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
