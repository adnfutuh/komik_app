import 'package:flutter/material.dart';

import '../../const/text/text.dart';
import '../../models/book_model.dart';
import '../../util/util.dart';
import '../navbar/info_content.dart';
import '../navbar/menu_navbar.dart';
import '../navbar/sinopsis_content.dart';

class BookDetailPhone extends StatefulWidget {
  final BookModel book;
  const BookDetailPhone({
    super.key,
    required this.book,
  });

  @override
  State<BookDetailPhone> createState() => _BookDetailPhoneState();
}

class _BookDetailPhoneState extends State<BookDetailPhone> {
  int _activeIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          "Detail Buku ",
          style: defaultTxt.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                height: util.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.book.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Image.asset(
                  widget.book.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 40),
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
        ),
      ),
    );
  }
}
