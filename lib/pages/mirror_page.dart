import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/text/text.dart';
import '../models/book_model.dart';
import '../providers/book_provider.dart';
import '../util/util.dart';
import '../widget/book/book_card.dart';

class MirrorPage extends StatelessWidget {
  const MirrorPage({
    super.key,
    required void Function(String bookId) onFavoriteToggle,
    required Set<String> favBooks,
  });

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    List<BookModel> books = bookProvider.books;
    Util util = Util(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15),
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Shinigami Adn',
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
                          Icons.chrome_reader_mode,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Komik Mirror',
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
                width: util.isPhone ? util.width * 7 : util.width * 0.8,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _getCrossAxisCount(util),
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 330 + util.height / 300 * 10,
                  ),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return BookCard(
                      book: books.last,
                      onFavoriteToggle: bookProvider.toggleFavorite,
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
