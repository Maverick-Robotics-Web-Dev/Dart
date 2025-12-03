import 'package:bee_viajes_turismo/infrastructure/models/user/geolocation_model.dart';

class Address {
  final Geolocation? geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  Address({
    this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  Address copyWith({
    Geolocation? geolocation,
    String? city,
    String? street,
    int? number,
    String? zipcode,
  }) => Address(
    geolocation: geolocation ?? this.geolocation,
    city: city ?? this.city,
    street: street ?? this.street,
    number: number ?? this.number,
    zipcode: zipcode ?? this.zipcode,
  );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    geolocation: Geolocation.fromJson(json["geolocation"]),
    city: json["city"],
    street: json["street"],
    number: json["number"],
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "geolocation": geolocation?.toJson(),
    "city": city,
    "street": street,
    "number": number,
    "zipcode": zipcode,
  };
}
