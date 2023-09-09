import 'package:book_widgets/domain/book.dart';
import 'package:book_widgets/pages/book_detail.dart';
import 'package:book_widgets/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Book> _favorites = [];
  @override
  void initState() {
    getFavorites(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Screen'),
      ),
      body: Column(
        children: [
          _favorites.isEmpty
              ? const Center(
                  child: Text(
                    "You don't have favorite books",
                    style: TextStyle(fontSize: 15, color: Colors.teal),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _favorites.length,
                  itemBuilder: (context, index) {
                    final book = _favorites[index];
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    Text(
                                      book.authorName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Text(
                                      book.releaseDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () =>
                                      navigateToBook(book, context),
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
    if (mounted) {
      getFavorites(context);
    }
  }

  Future<void> getFavorites(BuildContext context) async {
    final repository = context.read<BookRepositoryInterface>();
    final favorites = await repository.getFavoriteBooks();
    setState(() {
      _favorites = favorites;
    });
  }
}
