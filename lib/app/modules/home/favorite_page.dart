// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:book_widgets/app/modules/home/components/home_page_list_books_widget.dart';
import 'package:book_widgets/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritePage extends StatefulWidget {
  final HomeController controller;

  const FavoritePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    widget.controller.getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightsize = MediaQuery.sizeOf(context).height;
    double widthtsize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: widthtsize,
            height: heightsize * 0.10,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        widget.controller.getBooks();
                        Modular.to.pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  Text('Favoritos',
                      style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(width: 25,)
                ],
              ),
            ),
          ),
          HomePageListBooksWidget(
            heightsize: heightsize,
            controller: widget.controller,
            books: widget.controller.booksFavorite,
            route: () => widget.controller.getFavorites(),
          ),
        ],
      ),
    );
  }
}
