import 'package:flutter/material.dart';
import 'package:komik_app/const/const.dart';
import 'package:komik_app/models/book_model.dart';
import 'package:komik_app/models/enum.dart';
import 'package:komik_app/pages/detail_page.dart';
import 'package:provider/provider.dart';

import '../providers/book_provider.dart';
import '../util/util.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  final Function(String) onFavoriteToggle;

  const BookCard({
    super.key,
    required this.book,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

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
        child: Container(
          color: Colors.black,
          child: Column(children: [
            Stack(
              children: [
                Hero(
                  tag: book.bookId,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(book.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        right: 4,
                      ),
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
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 70 + Util(context).width / 300 * 10,
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
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
