import 'geolocation_entity.dart';

class Address {
  final Geolocation? geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  const Address({
    this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });
}
