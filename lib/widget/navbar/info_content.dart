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

    Widget buildInfo(String label, String value, bool isRow) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: isRow
            ? Row(
                children: [
                  Text(label,
                      style: commonStyle.copyWith(fontWeight: FontWeight.bold)),
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
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: commonStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value,
                    style: commonStyle.copyWith(fontSize: 14),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: !util.isPhone
          ? const EdgeInsets.fromLTRB(10, 10, 10, 20)
          : const EdgeInsets.fromLTRB(12, 20, 10, 10),
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
          if (!util.isPhone) ...[
            buildInfo('Rank :', book.rank, true),
            buildInfo('Alternative :', book.alternative, true),
            buildInfo('Author(s) :', book.author, true),
            buildInfo('Artist(s) :', book.artist, true),
            buildInfo('Genre(s) :', book.genre, true),
            buildInfo('Type :', book.komik.title, true),
            buildInfo('Release :', book.release, true),
            buildInfo('Status :', book.status, true),
          ] else ...[
            buildInfo('Rank :', book.rank, false),
            buildInfo('Alternative :', book.alternative, false),
            buildInfo('Author(s) :', book.author, false),
            buildInfo('Artist(s) :', book.artist, false),
            buildInfo('Genre(s) :', book.genre, false),
            buildInfo('Type :', book.komik.title, false),
            buildInfo('Release :', book.release, false),
            buildInfo('Status :', book.status, false),
          ],
        ],
      ),
    );
  }
}
