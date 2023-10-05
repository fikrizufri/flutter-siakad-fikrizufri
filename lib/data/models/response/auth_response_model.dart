import 'dart:convert';

class AuthResponseModel {
  final String jwtToken;
  final User user;

  AuthResponseModel({
    required this.jwtToken,
    required this.user,
  });

  factory AuthResponseModel.fromRawJson(String str) =>
      AuthResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        jwtToken: json["jwt-token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt-token": jwtToken,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final String roles;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": roles,
      };
}
