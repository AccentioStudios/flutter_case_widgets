import 'package:book_widgets/app/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:book_widgets/app/modules/home/data_source/home_data_source_local_app_impl.dart';
import 'package:book_widgets/app/modules/home/data_source/home_data_source_shared_preferences_impl.dart';

class HomeController extends ChangeNotifier {
  final IDataSource _dataSource;
  final IDataSourceLocalApp _dataSourceLocalApp;
  ValueNotifier<List<Book>> books = ValueNotifier([]);
  ValueNotifier<List<Book>> booksFavorite = ValueNotifier([]);
  ValueNotifier<bool> isFavorite = ValueNotifier(false);
  HomeController(
    this._dataSource,
    this._dataSourceLocalApp,
  );
  void _addFavorite({required String id}) async {
    await _dataSource.addFavorite(isFavorite: isFavorite.value, id: id);
  }

  void _removeFavorite({required String id}) async {
    await _dataSource.removeFavorite(isFavorite: isFavorite.value, id: id);
  }

  void getFavorites() {
    booksFavorite.value = [];
    for (var element in books.value) {
      if (element.isFavorite) {
        booksFavorite.value.add(element);
      }
    }
  }

  getBooks() async {
     List<Color> colors = [
      Colors.blueAccent.shade100,
      Colors.pink.shade100,
      Colors.teal.shade100
    ];
    final response = await _dataSourceLocalApp.getBooks(dataSource: _dataSource);
    for (var i = 0; i < response.length; i++) {
      response[i].cor = colors[i];
    }
    books.value = response;
    notifyListeners();
  }


  void manipulateFavorite({required String id, required int index}) {
    if (isFavorite.value) {
      isFavorite.value = false;
      for (var i = 0; i < books.value.length; i++) {
        if(books.value[i].id == id){
          books.value[i].isFavorite = false;
        }
      }
      _removeFavorite(id: id);
    } else {
      isFavorite.value = true;
      for (var i = 0; i < books.value.length; i++) {
        if(books.value[i].id == id){
          books.value[i].isFavorite = true;
        }
      }
      _addFavorite(id: id);
    }
    getFavorites();
  }
}
