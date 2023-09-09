import 'dart:convert';

import 'package:book_widgets/domain/book.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BookRepositoryInterface {
  Future<List<Book>> getBooks();
  Future<List<Book>> getFavoriteBooks();
  Future<bool> addFavoriteBook(Book book);
}

class BookRepositoryImp implements BookRepositoryInterface {
  BookRepositoryImp({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<bool> addFavoriteBook(Book book) async {
    List<String> favoritesBooks = _prefs.getStringList('favoriteBooks') ?? [];
    favoritesBooks.add(book.id.toString());
    await _prefs.setStringList('favoriteBooks', favoritesBooks);
    return true;
  }

  @override
  Future<List<Book>> getBooks() async {
    final String response = await rootBundle.loadString('assets/books.json');
    final Map<String, dynamic> data = await json.decode(response);
    final rawBooks = data['books'] as List;
    return rawBooks.map((rawBook) => Book.fromJson(rawBook)).toList();
  }

  @override
  Future<List<Book>> getFavoriteBooks() async {
    final rawBooks = await getBooks();
    final favoriteBooksid = _prefs.getStringList('favoriteBooks') ?? [];
    final data = rawBooks.where(
      (element) => favoriteBooksid.contains(
        element.id.toString(),
      ),
    );
    return data.toList();
  }
}
