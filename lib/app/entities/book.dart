// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Book {
  final String id;
  final String name;
  final String authorName;
  final String realeseDate;
  final String htmlContent;
  bool isFavorite;
  Color cor;

  Book({
    required this.id,
    required this.name,
    required this.authorName,
    required this.realeseDate,
    required this.htmlContent,
    this.isFavorite = false,
    this.cor = Colors.red,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'authorName': authorName,
      'realeseDate': realeseDate,
      'htmlContent': htmlContent,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'].toString(),
      name: map['name'] as String,
      authorName: map['authorName'] as String,
      realeseDate: map['releaseDate'] as String,
      htmlContent: map['htmlContent'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);
}
