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
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: defaultTxt.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
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
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: util.isPhone
                      ? 2
                      : util.isTablet
                          ? 3
                          : 6,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.5,
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
    );
  }
}
