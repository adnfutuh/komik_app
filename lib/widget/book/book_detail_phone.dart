import 'package:flutter/material.dart';

import '../../models/book_model.dart';

class BookDetailPhone extends StatefulWidget {
  final BookModel book;
  const BookDetailPhone({super.key, required this.book});

  @override
  State<BookDetailPhone> createState() => _BookDetailPhoneState();
}

class _BookDetailPhoneState extends State<BookDetailPhone> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
