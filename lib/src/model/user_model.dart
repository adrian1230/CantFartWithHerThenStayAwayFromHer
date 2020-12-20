import 'dart:convert';

class UserModel {
  String name;
  String type;
  String image;

  UserModel({
    this.name,
    this.type,
    this.image,
  });

  UserModel copyWith({
    String name,
    String type,
    String image,
  }) =>
      UserModel(
        name: name ?? this.name,
        type: type ?? this.type,
        image: image ?? this.image,
      );

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : json["type"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "type": type == null ? null : type,
    "image": image == null ? null : image,
  };
}