import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/domain.dart';

import '../user/user_mapper.dart';

class ProductMapper {
  static Product fromJsonToEntity(Map<String, dynamic> json) => Product(
    id: json['id'],
    title: json['title'],
    price: double.parse(json['price'].toString()),
    description: json['description'],
    slug: json['slug'],
    stock: double.parse(json['stock'].toString()),
    sizes: List<String>.from(json['sizes'].map((size) => size)),
    gender: json['gender'],
    tags: List<String>.from(json['tags'].map((size) => size)),
    images: List<String>.from(
      json['images'].map(
        (image) => image.startsWith('http')
            ? image
            : '${Enviroment.apiUrl}/files/product/$image',
      ),
    ),
    user: UserMapper.fromJsonToEntity(json['user']),
  );
}
