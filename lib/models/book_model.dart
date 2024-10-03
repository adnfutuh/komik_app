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
}
