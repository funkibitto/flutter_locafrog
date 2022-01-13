// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.email,
  });

  String id;
  String name;
  String profileImageUrl;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        profileImageUrl: json["profile_image_url"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_image_url": profileImageUrl,
        "email": email,
      };
}
