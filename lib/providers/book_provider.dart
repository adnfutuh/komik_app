import 'package:flutter/material.dart';
import 'package:komik_app/data_provider/dummy.dart';
import 'package:komik_app/models/book_model.dart';

class BookProvider with ChangeNotifier {
  final List<BookModel> _books = Dummy.books;
  final Set<String> _favBooks = {}; // Menggunakan Set untuk efisiensi

  List<BookModel> get books => _books;
  Set<String> get favBooks => _favBooks;

  // Mendapatkan daftar buku favorit
  List<BookModel> get favoriteBooks =>
      _books.where((book) => _favBooks.contains(book.bookId)).toList();

  void toggleFavorite(String bookId) {
    if (_favBooks.contains(bookId)) {
      _favBooks.remove(bookId);
    } else {
      _favBooks.add(bookId);
    }
    notifyListeners(); // Memperbarui listener
  }

  void clearFavorites() {
    _favBooks.clear();
    notifyListeners(); // Memperbarui listener setelah menghapus semua favorit
  }
}
