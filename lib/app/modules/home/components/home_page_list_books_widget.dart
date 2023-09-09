import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:book_widgets/app/modules/home/home_controller.dart';
import '../../../entities/book.dart';

class HomePageListBooksWidget extends StatelessWidget {
  final double heightsize;
  final HomeController controller;
  final ValueNotifier<List<Book>> books;
  final Function()? route;

  const HomePageListBooksWidget({
    Key? key,
    required this.heightsize,
    required this.controller,
    required this.books,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    void navigateToBook({required Book book, required int index}) {
      route;
      Modular.to.pushNamed('/bookdetail/', arguments: [book, index]);
    }

    return SizedBox(
      height: heightsize * 0.80,
      child: AnimatedBuilder(
        animation: books,
        builder: (context, child) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
          ),
          padding: const EdgeInsets.only(top: 30, right: 15, left: 15, bottom: 30),
          itemCount: books.value.length,
          itemBuilder: (context, index) {
            final book = books.value[index];

            return GestureDetector(
              onTap: () => navigateToBook(book: book, index: index),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: book.cor,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      blurRadius: 29,
                      spreadRadius: 0,
                      offset: Offset(
                        0,
                        7,
                      ),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(book.name,
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              book.authorName,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Text(
                            book.realeseDate,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
