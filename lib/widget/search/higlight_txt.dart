import 'package:flutter/material.dart';

import '../../const/text/text.dart';

RichText highlightText(String text, String query) {
  if (query.isEmpty) {
    return RichText(
      text: TextSpan(
        text: text,
        style: defaultTxt.copyWith(color: Colors.grey),
      ),
    );
  }

  final List<TextSpan> spans = [];
  final RegExp regex = RegExp(query, caseSensitive: false);
  final Iterable<Match> matches = regex.allMatches(text);

  int start = 0;

  for (final Match match in matches) {
    if (start < match.start) {
      spans.add(TextSpan(
          text: text.substring(start, match.start),
          style: defaultTxt.copyWith(color: Colors.grey)));
    }
    spans.add(TextSpan(
        text: match.group(0)!,
        style: defaultTxt.copyWith(
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.bold)));
    start = match.end;
  }

  if (start < text.length) {
    spans.add(TextSpan(
        text: text.substring(start),
        style: defaultTxt.copyWith(color: Colors.grey)));
  }

  return RichText(text: TextSpan(children: spans));
}
