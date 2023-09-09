import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:book_widgets/app/entities/book.dart';
import 'package:book_widgets/app/modules/home/home_controller.dart';

class BookDetailPage extends StatefulWidget {
  final HomeController controller;
  final int index;
  final Book book;


    const BookDetailPage({
    Key? key,
    required this.controller,
    required this.index,
    required this.book,
  }) : super(key: key);

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  void initState() {
    widget.controller.isFavorite.value = widget.book.isFavorite;
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
              color: widget.book.cor,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: SizedBox(
              child: Column(
                children: [
                  SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        Text(widget.book.name,
                            style: Theme.of(context).textTheme.titleMedium),
                        AnimatedBuilder(
                          animation: widget.controller.isFavorite,
                          builder: (context, child) =>
                              widget.controller.isFavorite.value
                                  ? IconButton(
                                      onPressed: () {
                                        widget.controller.manipulateFavorite(
                                            id: widget.book.id,
                                            index: widget.index);
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        widget.controller.manipulateFavorite(
                                            id: widget.book.id,
                                            index: widget.index);
                                      },
                                      icon: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                    ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: heightsize * 0.90,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, top: 30, left: 10, right: 10),
                child: HtmlWidget(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  widget.book.htmlContent,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
