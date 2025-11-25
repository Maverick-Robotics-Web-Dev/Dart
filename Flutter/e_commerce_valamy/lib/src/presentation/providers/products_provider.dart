import 'package:e_commerce_valamy/src/domain/entities/product_entity.dart';
import 'package:e_commerce_valamy/src/infrastructure/models/product_model.dart';
import 'package:e_commerce_valamy/src/shared/data/local_products.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  bool loading = true;
  List<ProductEntity> popularProducts = [];
  List<ProductEntity> flashSaleProducts = [];
  List<ProductEntity> bestSellersProducts = [];
  List<ProductEntity> kidsProducts = [];

  Future<void> loadPopularProducts() async {
    await Future.delayed(Duration(seconds: 2));

    final List<ProductEntity> products =
        demoPopularProducts
            .map((product) => ProductModel.fromJson(product).toProductEntity())
            .toList();

    popularProducts.addAll(products);
    loading = false;
    notifyListeners();
  }

  Future<void> loadFlashSaleProducts() async {
    await Future.delayed(Duration(seconds: 2));

    final List<ProductEntity> products =
        demoFlashSaleProducts
            .map((product) => ProductModel.fromJson(product).toProductEntity())
            .toList();

    flashSaleProducts.addAll(products);
    loading = false;
    notifyListeners();
  }

  Future<void> loadBestSellersProducts() async {
    await Future.delayed(Duration(seconds: 2));

    final List<ProductEntity> products =
        demoBestSellersProducts
            .map((product) => ProductModel.fromJson(product).toProductEntity())
            .toList();

    bestSellersProducts.addAll(products);
    loading = false;
    notifyListeners();
  }

  Future<void> loadKidsProducts() async {
    await Future.delayed(Duration(seconds: 2));

    final List<ProductEntity> products =
        demoKidsProducts
            .map((product) => ProductModel.fromJson(product).toProductEntity())
            .toList();

    kidsProducts.addAll(products);
    loading = false;
    notifyListeners();
  }
}
