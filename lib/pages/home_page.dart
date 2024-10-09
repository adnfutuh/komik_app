import 'package:flutter/material.dart';
import 'package:komik_app/const/text/text.dart';
import 'package:komik_app/models/book_model.dart';
import 'package:komik_app/widget/book/book_card.dart';
import 'package:provider/provider.dart';

import '../providers/book_provider.dart';
import '../util/util.dart';
import '../widget/book/book_search_delegate.dart';

class HomePage extends StatelessWidget {
  final Set<String> favBooks;
  final Function(String bookId) onFavoriteToggle;

  const HomePage({
    super.key,
    required this.favBooks,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    List<BookModel> books = bookProvider.books;
    Util util = Util(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildAppBar(context, books),
            _buildSectionTitle('Sedang Hangat'),
            _buildHorizontalBookList(util, books, bookProvider),
            _buildSectionTitle('Komik Terbaru'),
            _buildGridOfBooks(books, bookProvider, util),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context, List<BookModel> books) {
    Util util = Util(context);
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 100,
      flexibleSpace: SizedBox(
        width: util.width,
        child: FlexibleSpaceBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shinigami Adn',
                style: defaultTxt.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: BookSearchDelegate(
                      favBooks: favBooks,
                      toggleFav: onFavoriteToggle,
                      books: books,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSectionTitle(String title) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            title,
            style: defaultTxt.copyWith(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHorizontalBookList(
      Util util, List<BookModel> books, BookProvider bookProvider) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        height: 320 + util.height / 300 * 10,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length > 7 ? 7 : books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: util.isPhone ? 200 : 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: BookCard(
                    book: books[index],
                    onFavoriteToggle: bookProvider.toggleFavorite,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SliverGrid _buildGridOfBooks(
      List<BookModel> books, BookProvider bookProvider, Util util) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return BookCard(
            book: books[index],
            onFavoriteToggle: bookProvider.toggleFavorite,
          );
        },
        childCount: books.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(util),
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        mainAxisExtent: 320 + util.height / 300 * 10,
      ),
    );
  }

  int _getCrossAxisCount(Util util) {
    final width = util.width;

    if (util.isTablet && width > 401 && width <= 510) {
      return 3;
    } else if (util.isTablet && width > 511 && width <= 706) {
      return 4;
    } else if (util.isTablet && width > 706) {
      return 5;
    } else if (util.isPc && width > 851 && width <= 1100) {
      return 6;
    } else if (util.isPc && width > 1101) {
      return 7;
    } else {
      return 2;
    }
  }
}
