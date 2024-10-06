import 'package:flutter/material.dart';

import 'package:komik_app/widget/book/book_detail_pc.dart';
import 'package:komik_app/widget/book/book_detail_phone.dart';
import 'package:komik_app/widget/book/book_detail_tablet.dart';

import '../models/book_model.dart';
import '../util/util.dart';

class DetailPage extends StatelessWidget {
  final BookModel book;
  final List<String> favBooks;
  final Function(String) toggleFav;

  const DetailPage(
      {super.key,
      required this.favBooks,
      required this.toggleFav,
      required this.book});

  @override
  Widget build(BuildContext context) {
    Util util = Util(context);
    return Scaffold(
      body: util.isPc
          ? BookDetailPc(book: book)
          : util.isTablet
              ? BookDetailTablet(book: book)
              : BookDetailPhone(book: book),
    );
  }
}
