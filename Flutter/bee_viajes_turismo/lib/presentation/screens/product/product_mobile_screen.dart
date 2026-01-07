import 'package:flutter/material.dart';

class ProductMobileScreen extends StatefulWidget {
  final ThemeData appTheme;
  final String productId;

  const ProductMobileScreen({
    super.key,
    required this.appTheme,
    required this.productId,
  });

  @override
  State<ProductMobileScreen> createState() => _ProductMobileScreenState();
}

class _ProductMobileScreenState extends State<ProductMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Producto'), centerTitle: true),
      body: Center(child: Text(widget.productId)),
    );
  }
}
