import 'package:book_widgets/domain/book.dart';
import 'package:book_widgets/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key, required this.book});
  final Book book;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  int sliderValue = 16;
  @override
  Widget build(BuildContext context) {
    final repository = context.read<BookRepositoryInterface>();
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.book.name,
          style: TextStyle(
            fontSize: sliderValue.toDouble() - 2,
          ),
        ),
        actions: [
          Text(
            'Add to favorite',
            style: TextStyle(
              fontSize: sliderValue.toDouble() - 2,
            ),
          ),
          IconButton(
            onPressed: () async {
              final data = await repository.addFavoriteBook(widget.book);

              debugPrint(data.toString());
            },
            icon: Icon(
              Icons.star_border,
              size: sliderValue.toDouble() + 8,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SizedBox(height: sizeScreen.height),
          SingleChildScrollView(
            controller: ScrollController(),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    width: sizeScreen.width * 1.0,
                    height: sizeScreen.height * 0.2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Title: ${widget.book.name}',
                              style: TextStyle(
                                fontSize: sliderValue.toDouble(),
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Autor: ${widget.book.authorName}',
                              style: TextStyle(
                                fontSize: sliderValue.toDouble(),
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Release Date: ${widget.book.releaseDate}',
                              style: TextStyle(
                                fontSize: sliderValue.toDouble(),
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  HtmlWidget(
                    widget.book.htmlContent,
                    textStyle: TextStyle(
                      fontSize: sliderValue.toDouble(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            right: sizeScreen.width / 9.7,
            child: SizedBox(
              width: sizeScreen.width * 0.8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Size Text:"),
                      Slider(
                        value: sliderValue.toDouble(),
                        max: 25,
                        min: 16,
                        onChanged: (result) {
                          setState(
                            () {
                              sliderValue = result.round();
                              debugPrint(sliderValue.toString());
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
