import 'dart:convert';
import 'package:book_widgets/app/entities/book.dart';
import 'package:book_widgets/app/modules/home/data_source/home_data_source_shared_preferences_impl.dart';
import 'package:flutter/services.dart';


abstract class IDataSourceLocalApp {
  Future<List<Book>> getBooks({ required IDataSource dataSource});
}

class HomeDataSourceLocalAppImpl extends IDataSourceLocalApp {
  
  @override
  Future<List<Book>> getBooks({ required IDataSource dataSource}) async {
    
    List<Book> books = [];

    final String booksJson = await rootBundle.loadString('assets/books.json');
    final Map<String, dynamic> mapBooks = await jsonDecode(booksJson); 
    List<dynamic> listMapBooks = mapBooks.values.map((e) => e).toList();
    
    for (var i = 0; i < listMapBooks.length; i++) {

       listMapBooks[i].forEach((element) {
      return books.add(Book.fromMap(element));

    });
    }
    
    for (var i = 0; i < books.length; i++)  {

     bool favorite = await dataSource.getFavorite(id: books[i].id);
     books[i].isFavorite = favorite;
  
    }
    
    return books;
  }
}
