class Geolocation {
  final String lat;
  final String long;

  Geolocation({required this.lat, required this.long});

  Geolocation copyWith({String? lat, String? long}) =>
      Geolocation(lat: lat ?? this.lat, long: long ?? this.long);

  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      Geolocation(lat: json["lat"], long: json["long"]);

  Map<String, dynamic> toJson() => {"lat": lat, "long": long};
}
