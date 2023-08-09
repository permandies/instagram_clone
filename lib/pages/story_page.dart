import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class StroyPage extends StatelessWidget {
  final String imagePath;
  final PageController pageController = PageController();
  StroyPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(FontAwesomeIcons.angleLeft)),
        ),
        backgroundColor: Colors.black87,
        body: PageView.builder(
          itemCount: 6,
          controller: pageController,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/${index + 1}.jpg"),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: GestureDetector(
                      onTap: () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                    )),
                    Expanded(child: GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                    )),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
