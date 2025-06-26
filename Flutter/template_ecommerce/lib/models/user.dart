import 'package:template_ecommerce/models/dod.dart';
import 'package:template_ecommerce/models/id.dart';
import 'package:template_ecommerce/models/location.dart';
import 'package:template_ecommerce/models/loging.dart';
import 'package:template_ecommerce/models/name.dart';
import 'package:template_ecommerce/models/picture.dart';
import 'package:template_ecommerce/models/registered.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Registered registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
