// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

List<Book> bookFromJson(String str) => List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
  String id;
  String name;
  String bookId;
  String description;
  String genre;
  bool available;
  double price;
  String authorName;
  DateTime publishedDate;
  String deck;
  int issuedTo;
  DateTime issuedOn;
  DateTime returnDate;
  int v;

  Book({
    required this.id,
    required this.name,
    required this.bookId,
    required this.description,
    required this.genre,
    required this.available,
    required this.price,
    required this.authorName,
    required this.publishedDate,
    required this.deck,
    required this.issuedTo,
    required this.issuedOn,
    required this.returnDate,
    required this.v,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json["_id"],
    name: json["name"],
    bookId: json["bookId"],
    description: json["description"],
    genre: json["genre"],
    available: json["available"],
    price: json["price"]?.toDouble(),
    authorName: json["authorName"],
    publishedDate: DateTime.parse(json["publishedDate"]),
    deck: json["deck"],
    issuedTo: json["issuedTo"],
    issuedOn: DateTime.parse(json["issuedOn"]),
    returnDate: DateTime.parse(json["returnDate"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "bookId": bookId,
    "description": description,
    "genre": genre,
    "available": available,
    "price": price,
    "authorName": authorName,
    "publishedDate": publishedDate.toIso8601String(),
    "deck": deck,
    "issuedTo": issuedTo,
    "issuedOn": issuedOn.toIso8601String(),
    "returnDate": returnDate.toIso8601String(),
    "__v": v,
  };
}
