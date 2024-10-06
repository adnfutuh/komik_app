import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../const/const.dart';
import '../models/book_model.dart';
import '../providers/book_provider.dart';
import '../util/util.dart';
import '../widget/book/book_card.dart';

class FavoritePage extends StatelessWidget {
  final List<String> favBooks;
  final Function(String) onFavoriteToggle;

  const FavoritePage({
    super.key,
    required this.favBooks,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    Util util = Util(context);
    final bookProvider = Provider.of<BookProvider>(context);
    List<BookModel> favoriteBooks = bookProvider.favoriteBooks;

    return Scaffold(
      body: favoriteBooks.isEmpty
          ? Center(
              child: Text(
                'Tidak ada buku favorit!',
                style: defaultTxt.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          : SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    height: util.isPhone ? 160 : 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Komik Adnan Size: ${MediaQuery.of(context).size.width}',
                            style: defaultTxt.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.black87,
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              'Favorites',
                              style: defaultTxt.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: util.width * 0.8,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _getCrossAxisCount(util),
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          mainAxisExtent: 300,
                        ),
                        itemCount: favoriteBooks.length,
                        itemBuilder: (context, index) {
                          return BookCard(
                            book: favoriteBooks[index],
                            onFavoriteToggle: (bookId) {
                              onFavoriteToggle(bookId);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  int _getCrossAxisCount(Util util) {
    final width = util.width;

    if (util.isTablet && width > 401 && width <= 706) {
      return 3;
    } else if (util.isTablet && width > 706) {
      return 4;
    } else if (util.isPc && width > 851 && width <= 1100) {
      return 5;
    } else if (util.isPc && width > 1101) {
      return 6;
    } else {
      return 2;
    }
  }
}
