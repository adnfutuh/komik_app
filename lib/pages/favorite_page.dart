// import 'package:flutter/material.dart';
// import '../const/const.dart';
// import '../data_provider/dummy.dart';
// import '../models/book_model.dart';
// import '../util/util.dart';
// import '../widget/book_card.dart';

// class FavoritePage extends StatelessWidget {
//   final List<String> favBooks;
//   final Function(String) onFavoriteToggle;
//   const FavoritePage({
//     super.key,
//     required this.favBooks,
//     required this.onFavoriteToggle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Util util = Util(context);
//     List<BookModel> allBooks = Dummy.books;
//     List<BookModel> favoriteBooks =
//         allBooks.where((book) => favBooks.contains(book.bookId)).toList();

//     if (favoriteBooks.isEmpty) {
//       return Container(
//         color: Colors.black,
//         child: Center(
//           child: Text(
//             'Tidak ada buku favorit!',
//             style: defaultTxt.copyWith(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Text(
//             'Favorites',
//             style: defaultTxt.copyWith(color: Colors.white),
//           ),
//           Center(
//             child: SizedBox(
//               width: util.width * 0.8,
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: util.isPhone
//                       ? 2
//                       : util.isTablet
//                           ? 3
//                           : 6,
//                   mainAxisSpacing: 5,
//                   crossAxisSpacing: 5,
//                   childAspectRatio: 0.5,
//                 ),
//                 itemCount: favoriteBooks.length,
//                 itemBuilder: (context, index) {
//                   return BookCard(
//                     book: favoriteBooks[index],
//                     onFavoriteToggle: (bookId) {
//                       onFavoriteToggle(bookId);
//                     },
//                     favBooks: favBooks,
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../const/const.dart';
import '../data_provider/dummy.dart';
import '../models/book_model.dart';
import '../util/util.dart';
import '../widget/book_card.dart';

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
    List<BookModel> allBooks = Dummy.books;
    List<BookModel> favoriteBooks =
        allBooks.where((book) => favBooks.contains(book.bookId)).toList();

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Favorites', style: defaultTxt.copyWith(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
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
                    favBooks: favBooks,
                  );
                },
              ),
            ),
    );
  }
}
