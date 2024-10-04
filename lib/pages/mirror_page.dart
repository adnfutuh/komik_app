import 'package:flutter/material.dart';

import '../const/const.dart';
import '../data_provider/dummy.dart';
import '../models/book_model.dart';
import '../util/util.dart';
import '../widget/book_card.dart';

class MirrorPage extends StatelessWidget {
  const MirrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<BookModel> books = Dummy.books;
    Util util = Util(context);
    return Scaffold(
      backgroundColor: Colors.black87,
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
                          color: Colors.black,
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
              // Menggunakan Expanded di sini
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
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return BookCard(
                      book: books.last, // Mengambil buku terakhir
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
