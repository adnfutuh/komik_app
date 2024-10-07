import 'package:flutter/material.dart';
import 'package:komik_app/const/text/text.dart';
import 'package:komik_app/models/book_model.dart';
import 'package:komik_app/models/enum.dart';
import 'package:komik_app/pages/detail_page.dart';
import 'package:provider/provider.dart';

import '../../const/color/color.dart';
import '../../providers/book_provider.dart';
import '../../util/util.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  final Function(String) onFavoriteToggle;

  const BookCard({
    super.key,
    required this.book,
    required this.onFavoriteToggle,
  });

  Color getBackgroundColor(Komik komik) {
    switch (komik) {
      case Komik.manhwa:
        return warnaManhwa;
      case Komik.manhua:
        return warnaManhua;
      case Komik.manga:
        return warnaManga;
      default:
        return warnaDefault;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    Util util = Util(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              book: book,
              favBooks: bookProvider.favBooks,
              toggleFav: bookProvider.toggleFavorite,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.black,
        clipBehavior: Clip.hardEdge,
        child: Column(children: [
          Stack(
            children: [
              Hero(
                tag: '${book.bookId}_image',
                child: Container(
                  height: util.isPhone
                      ? 260 + util.width / 300 * 10
                      : 220 + util.width / 300 * 10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(book.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(top: 5, right: 4),
                      padding: const EdgeInsets.all(3),
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
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: bookProvider.favBooks.contains(book.bookId)
                        ? Colors.red
                        : Colors.black.withOpacity(0.7),
                  ),
                  onPressed: () {
                    onFavoriteToggle(book.bookId);
                    final isFavorited =
                        bookProvider.favBooks.contains(book.bookId);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isFavorited
                              ? 'Ditambahkan ke favorit'
                              : 'Dihapus dari favorit',
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: 60 + util.width / 300 * 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.9),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Text(
                book.title,
                textAlign: TextAlign.center,
                style: defaultTxt.copyWith(
                  fontSize: 12,
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
