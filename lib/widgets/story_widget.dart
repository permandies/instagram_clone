import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/pages/story_page.dart';
import 'package:instagram/widgets/costum_image.dart';

class StroyWidget extends StatefulWidget {
  StroyWidget({
    super.key,
  });

  @override
  State<StroyWidget> createState() => _StroyWidgetState();
}

class _StroyWidgetState extends State<StroyWidget> {
  var photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () async {
                resimCek();
              },
              child: Stack(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Align(
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: photo == null
                              ? null
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child:
                                      Image.memory(photo, fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Add Story",
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                  Positioned(
                      bottom: 30,
                      right: 0,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ))),
                ],
              ),
            );
          }
          return InkWell(
            onTap: () {
              Get.to(StroyPage(imagePath: "assets/$index.jpg"));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  CostumImage(
                    imagePath: "assets/$index.jpg",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text("Nick Name")
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  void resimCek() async {
    final ImagePicker picker = ImagePicker();
    final XFile? temp = await picker.pickImage(source: ImageSource.camera);
    photo = temp;
    photo = await photo!.readAsBytes();
    setState(() {});
  }
}
