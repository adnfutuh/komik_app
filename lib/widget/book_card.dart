import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:komik_app/const/const.dart';
import 'package:komik_app/models/book_model.dart';
import 'package:komik_app/models/enum.dart';

import '../util/util.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    Util util = Util(context);

    double height = 100;
    if (util.isPhone) {
      height += (util.width * 5 / 100);
      if (util.width > 250) {
        height += (util.width * 30 / 100);
      }
      if (util.width > 350) {
        height += (util.width * 10 / 100);
      }

      height = clampDouble(height, 100, 250);
    }
    if (util.isTablet) {
      height = 100;
      height += (util.width * 20 / 100);
      if (util.width > 550) {
        height += (util.width * 5 / 100);
      }
      if (util.width > 650) {
        height += (util.width * 5 / 100);
      }

      if (util.width > 750) {
        height += (util.width * 5 / 100);
      }

      height = clampDouble(height, 130, 200);
    }
    if (util.isPc) {
      height = 100;
      height += (util.width * 5 / 100);
      if (util.width > 850) {
        height += (util.width * 5 / 100);
      }
      if (util.width > 1150) {
        height += (util.width * 5 / 100);
      }
      height = clampDouble(height, 100, 250);
    }
    Color getBackgroundColor(Komik komik) {
      switch (komik) {
        case Komik.manhwa:
          return Colors.blue; // Warna untuk manhwa
        case Komik.manhua:
          return Colors.orange; // Warna untuk manhua
        case Komik.manga:
          return Colors.grey; // Warna untuk manga
        default:
          return Colors.black; // Warna default jika tidak ada yang cocok
      }
    }

    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(book.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: getBackgroundColor(book.komik),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        book.komik.title.toUpperCase(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 70 + Util(context).width / 400 * 10,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        end: AlignmentDirectional.topCenter,
                        begin: AlignmentDirectional.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.9)
                        ]),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ]),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  book.title,
                  textAlign: TextAlign.center,
                  style: defaultTxt.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
