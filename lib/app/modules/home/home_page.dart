import 'package:book_widgets/app/modules/home/components/home_page_list_books_widget.dart';
import 'package:book_widgets/app/modules/home/components/home_page_popup_menu_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:book_widgets/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getBooks();
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
          height: heightsize * 0.15,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: SizedBox(
            width: widthtsize,
            height: heightsize * 0.20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SafeArea(
                      child: Column(
                        children: [
                          HomePagePopupMenuButtonWidget(
                              controller: widget.controller),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Books', style: Theme.of(context).textTheme.titleLarge)
                  ],
                ),
              ],
            ),
          ),
        ),
        HomePageListBooksWidget(
            heightsize: heightsize,
            controller: widget.controller,
            books: widget.controller.books,
            route: () {}),
      ],
    ));
  }
}
