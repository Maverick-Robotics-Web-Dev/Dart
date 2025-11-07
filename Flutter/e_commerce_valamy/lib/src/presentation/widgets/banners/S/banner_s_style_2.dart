import 'package:e_commerce_valamy/src/presentation/widgets/banners/S/banner_s.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BannerSStyle2 extends StatelessWidget {
  const BannerSStyle2({
    super.key,
    this.image = "https://i.imgur.com/wQ0sNHT.png",
    required this.title,
    required this.press,
    this.subtitle,
    this.bottomText,
  });
  final String? image;
  final String title;
  final String? subtitle, bottomText;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerS(
      image: image!,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subtitle != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0 / 2,
                          vertical: 16.0 / 8,
                        ),
                        color: Colors.white70,
                        child: Text(
                          subtitle!,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    const SizedBox(height: 16.0 / 2),
                    Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    // const SizedBox(height: defaultPadding / 4),
                    if (bottomText != null)
                      Text(
                        bottomText!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Arrow - Right.svg",
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
