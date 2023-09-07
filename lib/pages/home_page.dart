import 'package:book_widgets/domain/book.dart';
import 'package:book_widgets/pages/book_detail.dart';
import 'package:book_widgets/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> _items = [];
  @override
  void initState() {
    readJson(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Widgets'),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final book = _items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: GestureDetector(
                  onTap: () => navigateToBook(book, context),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(book.name,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text(
                                book.authorName,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                book.releaseDate,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () => navigateToBook(book, context),
                            child: const Text('Read Book'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void navigateToBook(book, BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(book: book),
      ),
    );
  }

  Future<void> readJson(BuildContext context) async {
    final repository = context.read<BookRepositoryInterface>();
    final items = await repository.getBooks();
    setState(() {
      _items = items;
    });
  }
}
