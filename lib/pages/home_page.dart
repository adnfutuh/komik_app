import 'package:flutter/material.dart';
import 'package:komik_app/const/const.dart';
import 'package:komik_app/models/book_model.dart';
import 'package:komik_app/widget/book_card.dart';
import 'package:provider/provider.dart';

import '../providers/book_provider.dart';
import '../util/util.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required void Function(String bookId) onFavoriteToggle,
    required List<String> favBooks,
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
            // Header
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: util.isPhone ? 120 : 80,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Komik Adnan Size: ${MediaQuery.of(context).size.width}',
                  style: defaultTxt.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: SizedBox(
                  height: 30,
                  child: Text(
                    'Sedang Hangat',
                    style: defaultTxt.copyWith(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),

            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                height: util.isTablet ? 280 : 315,
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
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Komik Terbaru',
                    style: defaultTxt.copyWith(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverGrid(
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
                crossAxisCount: util.isPhone
                    ? 2
                    : util.isTablet
                        ? 3
                        : 6,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: 300,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
