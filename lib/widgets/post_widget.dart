import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/widgets/book_mark_widget.dart';
import 'package:instagram/widgets/costum_image.dart';
import 'package:instagram/widgets/like_widget.dart';

class PostWidget extends StatelessWidget {
  final String imagePath;
  final String nickName;
  const PostWidget({
    super.key,
    required this.imagePath,
    required this.nickName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              CostumImage(height: 50, width: 50, imagePath: imagePath),
              const SizedBox(
                width: 8,
              ),
              Text(
                nickName,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const FaIcon(FontAwesomeIcons.listOl),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Image.asset(imagePath),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              LikeWidget(),
              SizedBox(
                width: 15,
              ),
              FaIcon(
                FontAwesomeIcons.comment,
                size: 30,
              ),
              Spacer(),
              BookMarkWidget(),
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
