import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (product.images.isEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/img/no-image.jpg',
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: AssetImage('assets/gifs/bottle-loader.gif'),
            image: NetworkImage(product.images.first),
            fit: BoxFit.cover,
            height: 250,
            fadeOutDuration: Duration(milliseconds: 100),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
        Text(product.title, textAlign: TextAlign.center),
        SizedBox(height: 20),
      ],
    );
  }
}
