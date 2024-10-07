import 'package:flutter/material.dart';
import 'package:komik_app/const/text/text.dart';

import '../../models/book_model.dart';
import '../../util/util.dart';

class SinopsisContent extends StatelessWidget {
  final BookModel book;
  const SinopsisContent({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    Util util = Util(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      width: util.isPc ? util.width * 0.5 : util.width * 1,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 4), // Posisi bayangan
          ),
        ],
      ),
      child: Center(
        child: Text(
          book.sinopsis,
          style: defaultTxt.copyWith(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
