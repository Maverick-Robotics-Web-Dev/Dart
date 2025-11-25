import 'package:e_commerce_valamy/src/domain/entities/product_entity.dart';

class ProductModel {
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    image: json['image'] ?? 'Empty',
    brandName: json['brand_name'] ?? 'No Name',
    title: json['title'] ?? 'No title',
    price: json['price'] ?? 0.00,
    priceAfetDiscount: json['price_discount'] ?? 0.00,
    dicountpercent: json['dicount_percent'] ?? 0,
  );

  ProductEntity toProductEntity() => ProductEntity(
    image: image,
    brandName: brandName,
    title: title,
    price: price,
    priceAfetDiscount: priceAfetDiscount,
    dicountpercent: dicountpercent,
  );
}
