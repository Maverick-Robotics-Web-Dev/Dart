class AuthModel {
  final String token;

  AuthModel({required this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(token: json["token"]);

  Map<String, dynamic> toJson() => {"token": token};
}
