import 'package:komik_app/models/enum.dart';

class BookModel {
  final String bookId;
  final String imageUrl;
  final String title;
  final String rank;
  final String alternative;
  final String author;
  final String artist;
  final String genre;
  final Komik komik;
  final String release;
  final String status;
  final String sinopsis;
  BookModel({
    required this.bookId,
    required this.imageUrl,
    required this.title,
    required this.rank,
    required this.alternative,
    required this.author,
    required this.artist,
    required this.genre,
    required this.komik,
    required this.release,
    required this.status,
    required this.sinopsis,
  });
  BookModel copyWith({
    String? bookId,
    String? imageUrl,
    String? title,
    String? rank,
    String? alternative,
    String? author,
    String? artist,
    String? genre,
    Komik? komik,
    String? release,
    String? status,
    String? sinopsis,
  }) {
    return BookModel(
      bookId: bookId ?? this.bookId,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      rank: rank ?? this.rank,
      alternative: alternative ?? this.alternative,
      author: author ?? this.author,
      artist: artist ?? this.artist,
      genre: genre ?? this.genre,
      komik: komik ?? this.komik,
      release: release ?? this.release,
      status: status ?? this.status,
      sinopsis: sinopsis ?? this.sinopsis,
    );
  }
}
