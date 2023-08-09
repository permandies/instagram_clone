import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeWidget extends StatefulWidget {
  const LikeWidget({super.key});

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        isLiked = !isLiked;
        setState(() {});
      },
      icon: FaIcon(
        isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
        color: isLiked ? Colors.red : Colors.black,
        size: 30,
      ),
    );
  }
}
