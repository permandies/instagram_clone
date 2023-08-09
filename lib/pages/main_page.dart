import 'package:flutter/material.dart';
import 'package:instagram/widgets/post_widget.dart';
import 'package:instagram/widgets/story_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              if (index == 0) {
                return StroyWidget();
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: PostWidget(
                      imagePath: "assets/$index.jpg",
                      nickName: "Nick Name $index"),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
