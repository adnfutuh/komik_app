import 'package:flutter/material.dart';
import 'package:komik_app/const/const.dart';
import 'package:komik_app/util/util.dart';
import '../data_provider/dummy.dart';
import '../models/book_model.dart';
import '../widget/book_card.dart';

class ProjectPage extends StatefulWidget {
  final Function(String) onFavoriteToggle;

  final List<String> favBooks;
  const ProjectPage(
      {super.key, required this.onFavoriteToggle, required this.favBooks});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<String> favBooks = [];

  @override
  Widget build(BuildContext context) {
    List<BookModel> books = Dummy.books;
    Util util = Util(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15),
              height: util.isPhone ? 160 : 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Komik Adnan Size: ${MediaQuery.of(context).size.width}',
                        style: defaultTxt.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
                          Icons.list,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Project',
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
                    crossAxisCount: util.isPhone
                        ? 2
                        : util.isTablet
                            ? 3
                            : 6,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: books.length > 17 ? 17 : books.length,
                  itemBuilder: (context, index) {
                    return BookCard(
                      favBooks: widget.favBooks,
                      book: books[index],
                      onFavoriteToggle: widget.onFavoriteToggle,
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
}
