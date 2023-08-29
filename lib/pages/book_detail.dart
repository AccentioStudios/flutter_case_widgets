import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key, required this.book});
  final dynamic book;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book["name"]),
      ),
      body: SingleChildScrollView(
        child: HtmlWidget(
          widget.book["htmlContent"],
        ),
      ),
    );
  }
}
