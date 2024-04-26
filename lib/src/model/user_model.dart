// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String id;
  String name;
  String email;
  int uniqueId;
  String role;
  String password;
  List<dynamic> booksIssued;
  DateTime createAt;
  int v;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.uniqueId,
    required this.role,
    required this.password,
    required this.booksIssued,
    required this.createAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    uniqueId: json["uniqueId"],
    role: json["role"],
    password: json["password"],
    booksIssued: List<dynamic>.from(json["booksIssued"].map((x) => x)),
    createAt: DateTime.parse(json["createAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "uniqueId": uniqueId,
    "role": role,
    "password": password,
    "booksIssued": List<dynamic>.from(booksIssued.map((x) => x)),
    "createAt": createAt.toIso8601String(),
    "__v": v,
  };
}
