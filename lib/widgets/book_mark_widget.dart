import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookMarkWidget extends StatefulWidget {
  const BookMarkWidget({super.key});

  @override
  State<BookMarkWidget> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMarkWidget> {
  bool isBookMarked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        isBookMarked = !isBookMarked;
        setState(() {});
      },
      icon: FaIcon(
        isBookMarked
            ? FontAwesomeIcons.solidBookmark
            : FontAwesomeIcons.bookmark,
        size: 30,
      ),
    );
  }
}
