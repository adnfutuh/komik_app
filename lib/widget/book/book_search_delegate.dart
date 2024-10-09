import 'package:flutter/material.dart';
import 'package:komik_app/pages/detail_page.dart';
import '../../models/book_model.dart';
import '../search/higlight_txt.dart';

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
    final results = _searchBooks(query);

    if (results.isEmpty) {
      return _buildNoResultsContainer();
    }

    return _buildResultsList(results, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _searchBooks(query);

    if (suggestions.isEmpty) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            'Tidak ada saran ditemukan.',
          ),
        ),
      );
    }

    return _buildSuggestionsList(suggestions, context);
  }

  List<BookModel> _searchBooks(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return books.where((book) {
      return book.title.toLowerCase().contains(lowerCaseQuery) ||
          book.alternative.toLowerCase().contains(lowerCaseQuery);
    }).toList();
  }

  Widget _buildNoResultsContainer() {
    return Container(
      color: Colors.white,
      child: const Center(child: Text('Tidak ada hasil ditemukan.')),
    );
  }

  Widget _buildResultsList(List<BookModel> results, BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: results.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8.0),
        itemBuilder: (context, index) {
          final book = results[index];
          return ListTile(
            leading: Image.asset(
              book.imageUrl,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: highlightText(book.title, query),
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
          );
        },
      ),
    );
  }

  Widget _buildSuggestionsList(
      List<BookModel> suggestions, BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: suggestions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8.0),
        itemBuilder: (context, index) {
          final book = suggestions[index];
          return ListTile(
            leading: Image.asset(
              book.imageUrl,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: highlightText(book.title, query),
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
          );
        },
      ),
    );
  }
}
