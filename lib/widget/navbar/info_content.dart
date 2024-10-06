import 'package:flutter/material.dart';
import 'package:komik_app/const/text/text.dart';
import 'package:komik_app/util/util.dart';

import '../../models/book_model.dart';

class InfoContent extends StatelessWidget {
  final BookModel book;
  const InfoContent({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    Util util = Util(context);

    TextStyle commonStyle = defaultTxt.copyWith(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );

    // Widget untuk menampilkan label dan nilai
    Widget buildInfoRow(String label, String value) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Text(
              label,
              style: commonStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                value,
                style: commonStyle.copyWith(fontSize: 14),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      height: util.height * 0.5,
      width: util.isPc ? util.width * 0.5 : util.width * 1,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInfoRow('Rank :', book.rank),
          buildInfoRow('Alternative :', book.alternative),
          buildInfoRow('Author(s) :', book.author),
          buildInfoRow('Artist(s) :', book.artist),
          buildInfoRow('Genre(s) :', book.genre),
          buildInfoRow('Type :', book.komik.title),
          buildInfoRow('Release :', book.release),
          buildInfoRow('Status :', book.status),
        ],
      ),
    );
  }
}
