import 'package:flutter/material.dart';
import 'package:komik_app/const/text/text.dart';
import 'package:komik_app/models/book_model.dart';
import 'package:komik_app/util/util.dart';
import 'package:komik_app/widget/navbar/menu_navbar.dart';

import '../navbar/info_content.dart';
import '../navbar/sinopsis_content.dart';

class BookDetailPc extends StatefulWidget {
  final BookModel book;

  const BookDetailPc({super.key, required this.book});

  @override
  State<BookDetailPc> createState() => _BookDetailPcState();
}

class _BookDetailPcState extends State<BookDetailPc> {
  int _activeIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookId = widget.book.bookId;
    Util util = Util(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Detail Buku ${MediaQuery.of(context).size.width}",
          style: defaultTxt.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(
                    widget.book.title,
                    style: defaultTxt.copyWith(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    height: util.height * 0.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.book.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Hero(
                      tag: '${bookId}_image',
                      child: Image.asset(
                        widget.book.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MenuNavbar(
                        changeIndex: _changeIndex,
                        activeIndex: _activeIndex,
                      ),
                      const SizedBox(height: 10),
                      IndexedStack(
                        index: _activeIndex,
                        children: [
                          InfoContent(book: widget.book),
                          SinopsisContent(book: widget.book),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
