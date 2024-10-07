import 'package:flutter/material.dart';
import 'package:komik_app/const/text/text.dart';
import 'package:komik_app/pages/detail_page.dart';
import '../../models/book_model.dart';

class BookSearchDelegate extends SearchDelegate {
  final Set<String> favBooks;
  final Function(String) toggleFav;
  final List<BookModel> books;

  BookSearchDelegate({
    required this.favBooks,
    required this.toggleFav,
    required this.books,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Menghapus teks pencarian
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Menutup dialog pencarian
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = books.where((book) {
      final lowerCaseQuery = query.toLowerCase();
      return book.title.toLowerCase().contains(lowerCaseQuery) ||
          book.alternative.toLowerCase().contains(lowerCaseQuery);
    }).toList();

    if (results.isEmpty) {
      return const Center(child: Text('Tidak ada hasil ditemukan.'));
    }

    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: 8.0), // Jarak antar item
      itemBuilder: (context, index) {
        final book = results[index];
        return Container(
          margin: const EdgeInsets.only(top: 20),
          child: ListTile(
            leading: Image.asset(
              book.imageUrl, // Pastikan ini adalah asset lokal
              width: 50, // Atur lebar gambar
              fit: BoxFit.cover,
            ),
            title: Text(
              book.title,
              style: defaultTxt.copyWith(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    book: book,
                    favBooks: favBooks,
                    toggleFav: toggleFav,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Mulai mengetik untuk melihat saran.'));
    }

    List<BookModel> suggestions;
    if (books.any(
        (book) => book.title.toLowerCase().contains(query.toLowerCase()))) {
      // Jika judul cocok, saran hanya dari judul
      suggestions = books
          .where(
              (book) => book.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      // Jika alternatif cocok, saran dari judul
      suggestions = books
          .where((book) =>
              book.alternative.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    if (suggestions.isEmpty) {
      return const Center(child: Text('Tidak ada saran ditemukan.'));
    }

    return ListView.separated(
      itemCount: suggestions.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: 8.0), // Jarak antar item
      itemBuilder: (context, index) {
        final book = suggestions[index];
        return ListTile(
          title: Text(
            book.title,
            style: defaultTxt.copyWith(color: Colors.white),
          ),
          onTap: () {
            query = book.title; // Mengisi query dengan saran yang dipilih
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  book: book,
                  favBooks: favBooks,
                  toggleFav: toggleFav,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
