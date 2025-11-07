import 'package:e_commerce_valamy/src/presentation/widgets/network_image_with_loader.dart';
import 'package:flutter/material.dart';

class BannerL extends StatelessWidget {
  const BannerL({
    super.key,
    required this.image,
    required this.press,
    required this.children,
  });

  final String image;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            NetworkImageWithLoader(image, radius: 0),
            Container(color: Colors.black45),
            ...children,
          ],
        ),
      ),
    );
  }
}
