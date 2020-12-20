import 'dart:convert';

class UserModel {
  String name;
  String type;
  double rating;
  double satisfaction;
  String image;

  UserModel({
    this.name,
    this.type,
    this.rating,
    this.satisfaction,
    this.image,
  });

  UserModel copyWith({
    String name,
    String type,
    double rating,
    double satisfaction,
    String image,
  }) =>
      UserModel(
        name: name ?? this.name,
        type: type ?? this.type,
        rating: rating ?? this.rating,
        satisfaction: satisfaction ?? this.satisfaction,
        image: image ?? this.image,
      );

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : json["type"],
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    satisfaction: json["satisfaction"] == null ? null : json["satisfaction"].toDouble(),
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "type": type == null ? null : type,
    "rating": rating == null ? null : rating,
    "satisfaction": satisfaction == null ? null : satisfaction,
    "image": image == null ? null : image,
  };
}