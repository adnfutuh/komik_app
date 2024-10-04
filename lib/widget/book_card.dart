import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:komik_app/const/const.dart';
import 'package:komik_app/models/book_model.dart';

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

    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(book.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    book.komik.title.toUpperCase(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(3),
                child: Text(
                  book.title,
                  style: defaultTxt.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
